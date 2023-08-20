import { FactoryMap } from "shared/FactoryMap";
import { WEAPON_HANDLER_TYPES } from "shared/Weapon/WEAPON_HANDLER_TYPES";
import { WeaponManager } from "shared/Weapon/WeaponManager";
import { BaseFireHandler } from "./ServerWeaponHandlers/Base/ServerBaseFireHandler";
import { BaseHitHandler } from "./ServerWeaponHandlers/Base/ServerBaseHitHandler";

export class ServerWeaponManager extends WeaponManager {
    constructor(){
        super()
    }
}