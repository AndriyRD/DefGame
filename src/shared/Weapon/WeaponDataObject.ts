import { AmmoContainer } from "./Ammo/AmmoContainer";
import { WeaponAssetParser } from "./Asset/WeaponAssetParser";
import { IWeaponConfig } from "./WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "./WeaponModel/IWeaponModel";

export class WeaponDataObject{
    readonly Name;
    readonly FireDelay;
    readonly Assets;
    readonly Ammo;

    constructor(model: IWeaponModel, config: IWeaponConfig){
        this.Name = model.Model.Name
        this.FireDelay = 1/config.FireSpeed
        this.Assets = WeaponAssetParser.Parse(this.Name)
        this.Ammo = new AmmoContainer(config.AmmoConfig)
    }
}