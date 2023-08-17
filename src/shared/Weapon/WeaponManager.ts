import { Weapon } from "./Weapon";
import { WEAPON_HANDLER_TYPES } from "./WEAPON_HANDLER_TYPES";
import { IWeaponConfig } from "./WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "./WeaponModel/IWeaponModel";
import { FireModuleFactory } from "./WeponBuilder/FireModuleFactory";
import { WeaponBuilder } from "./WeponBuilder/WeaponBuilder";
import { PersonWeaponBuilder } from "./WeponBuilder/PersonWeaponBuilder";
import { WEAPON_CLASSES } from "./WEAPON_CLASSES";

export abstract class WeaponManager {
    protected builders = {
        [WEAPON_CLASSES.DEFAULT]: new WeaponBuilder(),
        [WEAPON_CLASSES.PERSON_WEAPOM]: new PersonWeaponBuilder()
    }
    protected readonly weaponList = new Map<Player, Weapon<IWeaponConfig, IWeaponModel>[]>
    protected readonly factories = new Map<WEAPON_HANDLER_TYPES, FireModuleFactory<IWeaponModel>>()

    protected FindHandlerFactory(handlerType: WEAPON_HANDLER_TYPES){
        const factory = this.factories.get(handlerType)
        if(!factory) error(`Not found weapon-handler type: ${handlerType}`)
        return factory
    }

    RegisterWeapon(plaeyr: Player, model: Model, weaponClass: WEAPON_CLASSES){
        let playerWeaponList = this.weaponList.get(plaeyr)
        const name = model.Name
        const builder = this.builders[weaponClass]
        builder.ParseConfig(name).ParseModel(model)

        const config = builder.GetConfig()!
        const newWeapon = builder
            .SetFireModuleFactory(this.FindHandlerFactory(config.HandlerType))
            .Build()

        if(!playerWeaponList)
            playerWeaponList = new Array()
        playerWeaponList.push(newWeapon)
        this.weaponList.set(plaeyr, playerWeaponList)
    }

    UnregisterWeapon(){
        //TODO: Clear from memory
    }
}