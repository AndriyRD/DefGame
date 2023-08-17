import { FactoryMap } from "shared/FactoryMap";
import { WEAPON_HANDLER_TYPES } from "shared/Weapon/WEAPON_HANDLER_TYPES";
import { WeaponHandlerFactory } from "shared/Weapon/WeaponContainer/WeaponContainerFactory";
import { WeaponManager } from "shared/Weapon/WeaponManager";
import { BaseFireHandler } from "./Handlers/Base/ClientBaseFireHandler";
import { IWeapon } from "shared/Weapon/Weapon";
import { IHitHandler } from "shared/Weapon/WeaponHandler/IHitHandler";
import { BaseHitHandler } from "./Handlers/Base/ClientBaseHitHandler";

export class WeaponProvider{
    static weaponManager = new WeaponManager(
        new FactoryMap<WEAPON_HANDLER_TYPES, WeaponHandlerFactory>()
            .Set(WEAPON_HANDLER_TYPES.BASE, () => {return {
                CreateFireHandler: (weapon: IWeapon, hitHandler: IHitHandler) => new BaseFireHandler(weapon, hitHandler),
                CreateHitHandler: (weapon: IWeapon) => new BaseHitHandler(weapon)
            }})
    )
}