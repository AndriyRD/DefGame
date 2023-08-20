import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { Weapon } from "../Weapon";

export class BaseWeapon<ConfigType extends IWeaponConfig, ModelType extends IWeaponModel> extends Weapon<ConfigType, ModelType>{
    protected OnRemoveOwner(plr: Player): void {
        
    }
    protected OnNewOwner(plr: Player): void {
        
    }

    Reload(){
        this.DataObject.Ammo.Reload()
    }
}