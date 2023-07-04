import { WEAPON_HANDLER_TYPES } from "shared/Weapon/WEAPON_HANDLER_TYPES"
import { WeaponHandlerFactory, WeaponHandlerFactoryList } from "shared/Weapon/WeaponContainerFactory"
import { WeaponManager } from "shared/Weapon/WeaponManager"
import { BaseFireHandler } from "./ServerWeaponHandlers/Base/ServerBaseFireHandler"
import { BaseHitHandler } from "./ServerWeaponHandlers/Base/ServerBaseHitHandler"
import { WeaponContainer } from "shared/Weapon/WeaponContainer"

export class ServerWeaponManager extends WeaponManager {
    
    protected InitFactories(): WeaponHandlerFactoryList {
        const list = new Map<WEAPON_HANDLER_TYPES, WeaponHandlerFactory>()

        list.set(WEAPON_HANDLER_TYPES.BASE, {
            CreateFireHandler: (w) => new BaseFireHandler(w),
            CreateHitHandler: (w) => new BaseHitHandler(w)
        })

        return list
    }

}