import { FactoryMap } from "shared/FactoryMap";
import { WEAPON_HANDLER_TYPES } from "shared/Weapon/WEAPON_HANDLER_TYPES";
import { WeaponManager } from "shared/Weapon/WeaponManager";
import { BaseFireHandler } from "./Handlers/Base/ClientBaseFireModule";
import { IHitHandler } from "shared/Weapon/FireModule/IHitHandler";
import { BaseHitHandler } from "./Handlers/Base/ClientBaseHitHandler";
import { IWeaponModel } from "shared/Weapon/WeaponModel/IWeaponModel";
import { FireModuleFactory } from "shared/Weapon/WeponBuilder/FireModuleFactoryType";
import { WEAPON_CLASSES } from "shared/Weapon/WEAPON_CLASSES";

export class ClientWeaponManager extends WeaponManager {

    constructor(){
        super()
        // this.factories.set(WEAPON_HANDLER_TYPES, (model) => new BaseFireHandler())
    }
}