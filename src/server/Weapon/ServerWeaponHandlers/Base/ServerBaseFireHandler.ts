import { IWeapon } from "shared/Weapon/IWeapon";
import { IFireHandler } from "shared/Weapon/WeaponHandler/IFireHandler";

export class BaseFireHandler implements IFireHandler {

    Fire(): IFireHandler {
        return this
    }
    
    constructor(protected readonly weapon: IWeapon){}
}