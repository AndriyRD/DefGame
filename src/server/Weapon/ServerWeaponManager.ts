import { FactoryMap } from "shared/FactoryMap";
import { IWeapon } from "shared/Weapon/Weapon";
import { WEAPON_HANDLER_TYPES } from "shared/Weapon/WEAPON_HANDLER_TYPES";
import { WeaponHandlerFactory } from "shared/Weapon/WeaponContainer/WeaponContainerFactory";
import { WeaponManager } from "shared/Weapon/WeaponManager";
import { BaseFireHandler } from "./ServerWeaponHandlers/Base/ServerBaseFireHandler";
import { BaseHitHandler } from "./ServerWeaponHandlers/Base/ServerBaseHitHandler";

export class ServerWeaponManager extends WeaponManager {
    constructor(){
        const factories = new FactoryMap<WEAPON_HANDLER_TYPES, WeaponHandlerFactory>()
        .Set(WEAPON_HANDLER_TYPES.BASE, () => {return {
            CreateFireHandler: (weapon: IWeapon) => new BaseFireHandler(weapon),
            CreateHitHandler: (weapon: IWeapon) => new BaseHitHandler(weapon)
        }})

        super(factories)
    }
}