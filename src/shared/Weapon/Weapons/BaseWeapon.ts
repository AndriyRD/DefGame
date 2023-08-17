import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { Weapon } from "../Weapon";

export class BaseWeapon extends Weapon<IWeaponConfig, IWeaponModel>{
    protected OnRemoveOwner(plr: Player): void {
        
    }
    protected OnNewOwner(plr: Player): void {
        
    }
}