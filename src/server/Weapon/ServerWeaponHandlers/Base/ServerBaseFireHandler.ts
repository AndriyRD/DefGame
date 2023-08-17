import { IWeapon } from "shared/Weapon/Weapon";
import { IFireHandler } from "shared/Weapon/WeaponHandler/IFireHandler";

export class BaseFireHandler implements IFireHandler {

    Fire(): IFireHandler {
        return this
    }
    
    constructor(protected readonly weapon: IWeapon){}
}