import { Weapon } from "./Weapon";
import { WEAPON_HANDLER_TYPES } from "./WEAPON_HANDLER_TYPES";
import { IWeaponConfig } from "./WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "./WeaponModel/IWeaponModel";
import { FireModuleFactory } from "./WeponBuilder/FireModuleFactoryType";
import { BaseWeaponBuilder } from "./WeponBuilder/BaseWeaponBuilder";
import { PersonWeaponBuilder } from "./WeponBuilder/PersonWeaponBuilder";
import { WEAPON_CLASSES } from "./WEAPON_CLASSES";
import WEAPON_CONFIG_LIST from "./WEAPON_CONFIG_LIST";
import { IWeaponAssets } from "./Asset/IWeaponAssets";
import { IPresonWeaponConfig } from "./WeaponConfigurations/IPresonWeaponConfig";

export abstract class WeaponManager {
    protected builders = {
        [WEAPON_CLASSES.DEFAULT]: new BaseWeaponBuilder(),
        [WEAPON_CLASSES.PERSON_WEAPOM]: new PersonWeaponBuilder()
    }
    protected readonly weaponList = new Map<Player, Weapon<IWeaponConfig, IWeaponModel, IWeaponAssets>[]>
    protected readonly factories = new Map<WEAPON_HANDLER_TYPES, FireModuleFactory<IWeaponModel, IWeaponAssets>>()

    protected FindHandlerFactory(handlerType: WEAPON_HANDLER_TYPES){
        const factory = this.factories.get(handlerType)
        if(!factory) error(`Not found weapon-handler type: ${handlerType}`)
        return factory
    }

    RegisterWeapon(plaeyr: Player, model: Model){
        let playerWeaponList = this.weaponList.get(plaeyr)
        const name = model.Name
        const config = WEAPON_CONFIG_LIST.get(name)
        if(!config) error(`Not found config for weapon: ${name}`)
        const builder = this.builders[config.WeaponClass]

        const newWeapon = builder
            .SetConfig(config)
            .ParseModel(model)
            .SetFireModuleFactory(this.FindHandlerFactory(config.HandlerType))
            .Build()

        if(!playerWeaponList) playerWeaponList = new Array()
        playerWeaponList.push(newWeapon)
        this.weaponList.set(plaeyr, playerWeaponList)
        return newWeapon
    }

    UnregisterWeapon(){
        //TODO: Clear from memory   
    }
}