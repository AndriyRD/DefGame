import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { Weapon } from "../Weapon";
import { IWeaponAssets } from "../Asset/IWeaponAssets";

export class BaseWeapon<ConfigType extends IWeaponConfig, ModelType extends IWeaponModel, AssetType extends IWeaponAssets> extends Weapon<ConfigType, ModelType, AssetType>{
    Reload(){
        this.DataObject.Ammo.Reload()
    }
}