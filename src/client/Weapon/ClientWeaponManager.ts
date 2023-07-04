import { WEAPON_HANDLER_TYPES } from "shared/Weapon/WEAPON_HANDLER_TYPES";
import { WeaponHandlerFactory, WeaponHandlerFactoryList } from "shared/Weapon/WeaponContainerFactory";
import { WeaponManager } from "shared/Weapon/WeaponManager";
import { BaseFireHandler } from "./Handlers/Base/ClientBaseFireHandler";
import { IWeapon } from "shared/Weapon/IWeapon";
import { BaseHitHandler } from "./Handlers/Base/ClientBaseHitHandler";
import { IHitHandler } from "shared/Weapon/WeaponHandler/IHitHandler";

export class ClientWeaponManager extends WeaponManager {

    protected InitFactories(): WeaponHandlerFactoryList {
        const list = new Map<WEAPON_HANDLER_TYPES, WeaponHandlerFactory>()

        list.set(WEAPON_HANDLER_TYPES.BASE, {
            CreateFireHandler: (w: IWeapon, h: IHitHandler) => new BaseFireHandler(w, h),
            CreateHitHandler: (w: IWeapon) => new BaseHitHandler(w)
        })

        return list
    }
}