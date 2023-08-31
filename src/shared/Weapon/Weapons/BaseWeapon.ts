import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { Weapon } from "./Weapon";
import { IWeaponAssets } from "../Asset/IWeaponAssets";
import { IWeapon } from "../IWeapon";
import { FireModuleFactory } from "../WeponBuilder/FireModuleFactoryType";
import { WeaponAssetParser } from "../Asset/WeaponAssetParser";
import { IAutoFiredWeapon } from "../IAutoFiredWeapon";
import { AutoFire } from "../FireModule/AutoFire";

export class BaseWeapon extends Weapon<IWeaponConfig, IWeaponModel, IWeaponAssets> implements IWeapon, IAutoFiredWeapon{
    private readonly autoFire: AutoFire

    Reload(){
        this.DataObject.Ammo.Reload()
    }

    StartFire(): IAutoFiredWeapon {
        this.autoFire.StartFire()
        return this
    }

    StopFire(): IAutoFiredWeapon {
        this.autoFire.StopFire()
        return this
    }

    constructor(model: IWeaponModel, config: IWeaponConfig, createFireModule: FireModuleFactory<IWeaponModel, IWeaponAssets>){
        super(model, config, createFireModule, new WeaponAssetParser())
        this.autoFire = new AutoFire(this.fireModule)
    }
} 