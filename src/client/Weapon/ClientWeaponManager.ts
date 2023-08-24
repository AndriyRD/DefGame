import { WEAPON_HANDLER_TYPES } from "shared/Weapon/WEAPON_HANDLER_TYPES";
import { WeaponManager } from "shared/Weapon/WeaponManager";
import { BaseFireModule } from "./Handlers/Base/ClientBaseFireModule";

export class ClientWeaponManager extends WeaponManager {

    constructor(){
        super()
        this.factories.set(WEAPON_HANDLER_TYPES.BASE, (m, d) => new BaseFireModule(d, m))
    }
}