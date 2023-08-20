import { AmmoContainer } from "./Ammo/AmmoContainer";
import { IAssetParser } from "./Asset/IAssetParser";
import { IWeaponAssets } from "./Asset/IWeaponAssets";
import { WeaponAssetParser } from "./Asset/WeaponAssetParser";
import { IWeaponConfig } from "./WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "./WeaponModel/IWeaponModel";

export class WeaponDataObject<T extends IWeaponAssets>{
    readonly Name;
    readonly FireDelay;
    readonly Assets;
    readonly Ammo;

    constructor(model: IWeaponModel, config: IWeaponConfig, assetParser: IAssetParser<T>){
        this.Name = model.Model.Name
        this.FireDelay = 1/config.FireSpeed
        this.Assets = assetParser.Parse(this.Name)
        this.Ammo = new AmmoContainer(config.AmmoConfig)
    }
}