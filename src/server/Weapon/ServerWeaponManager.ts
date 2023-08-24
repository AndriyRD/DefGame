import { WEAPON_HANDLER_TYPES } from "shared/Weapon/WEAPON_HANDLER_TYPES";
import { WeaponManager } from "shared/Weapon/WeaponManager";
import { ServerBaseFireModule } from "./ServerWeaponHandlers/Base/ServerBaseFireModule";

export class ServerWeaponManager extends WeaponManager {
    constructor(){
        super()
        this.factories.set(WEAPON_HANDLER_TYPES.BASE, (model, dataObj) => new ServerBaseFireModule(dataObj, model))
    }
}