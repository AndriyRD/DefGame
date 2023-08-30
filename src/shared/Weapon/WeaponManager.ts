import { Weapon } from "./Weapons/Weapon";
import { WEAPON_HANDLER_TYPES } from "./WEAPON_HANDLER_TYPES";
import { IWeaponConfig } from "./WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "./WeaponModel/IWeaponModel";
import { FireModuleFactory } from "./WeponBuilder/FireModuleFactoryType";
import { BaseWeaponBuilder } from "./WeponBuilder/BaseWeaponBuilder";
import { PersonWeaponBuilder } from "./WeponBuilder/PersonWeaponBuilder";
import { WEAPON_CLASSES } from "./WEAPON_CLASSES";
import { IWeaponAssets } from "./Asset/IWeaponAssets";
import { ConfigurationSrorage } from "shared/Configuration/ConfigurationSrorage";
import { IWeapon } from "./IWeapon";

export abstract class WeaponManager {
    protected builders = {
        [WEAPON_CLASSES.DEFAULT]: new BaseWeaponBuilder(),
        [WEAPON_CLASSES.PERSON_WEAPOM]: new PersonWeaponBuilder()
    }
    protected readonly weaponList = new Array<IWeapon>
    protected readonly factories = new Map<WEAPON_HANDLER_TYPES, FireModuleFactory<IWeaponModel, IWeaponAssets>>()

    protected FindHandlerFactory(handlerType: WEAPON_HANDLER_TYPES){
        const factory = this.factories.get(handlerType)
        if(!factory) error(`Not found weapon-handler type: ${handlerType}`)
        return factory
    }

    GetOwnerWeapons(owner: Player){
        return this.weaponList.filter(weapon => weapon.OwnerState.GetCurrent() === owner)
    }

    GetByModel(model: Model){
        return this.weaponList.find(weapon => weapon.WeaponModel.Model === model)
    }

    GetById(owner: Player, id: string){
        return this.GetOwnerWeapons(owner).find(weapon => weapon.WeaponModel.Model.Name === id)
    }

    RegisterWeapon(model: Model){
        const name = model.Name
        const config = ConfigurationSrorage.WeaponConfiguration.Get(name)
        if(!config) error(`Not found config for weapon: ${name}`)
        const builder = this.builders[config.WeaponClass]

        const newWeapon = builder
            .SetConfig(config)
            .ParseModel(model)
            .SetFireModuleFactory(this.FindHandlerFactory(config.HandlerType))
            .Build()

        this.weaponList.push(newWeapon)
        return newWeapon
    }

    UnregisterWeapon(){
        //TODO: Clear from memory   
    }
}