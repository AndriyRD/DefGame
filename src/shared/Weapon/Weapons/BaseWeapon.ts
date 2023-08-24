import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { Weapon } from "../Weapon";
import { IWeaponAssets } from "../Asset/IWeaponAssets";
import { IWeapon } from "../IWeapon";

export class BaseWeapon extends Weapon<IWeaponConfig, IWeaponModel, IWeaponAssets> implements IWeapon{
    Reload(){
        this.DataObject.Ammo.Reload()
    }
}