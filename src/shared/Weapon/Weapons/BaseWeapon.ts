import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { Weapon } from "../Weapon";
import { IWeaponAssets } from "../Asset/IWeaponAssets";
import { IWeapon } from "../IWeapon";
import { FireModuleFactory } from "../WeponBuilder/FireModuleFactoryType";
import { WeaponAssetParser } from "../Asset/WeaponAssetParser";

export class BaseWeapon extends Weapon<IWeaponConfig, IWeaponModel, IWeaponAssets> implements IWeapon{
    Reload(){
        this.DataObject.Ammo.Reload()
    }

    constructor(model: IWeaponModel, config: IWeaponConfig, createFireModule: FireModuleFactory<IWeaponModel, IWeaponAssets>){
        super(model, config, createFireModule, new WeaponAssetParser())
    }
} 