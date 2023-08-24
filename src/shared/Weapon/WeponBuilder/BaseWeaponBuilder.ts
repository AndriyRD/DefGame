import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { BaseWeapon } from "../Weapons/BaseWeapon";
import { WeaponModelParser } from "../ModelParsers/WeaponModelParser";
import { IWeaponAssets } from "../Asset/IWeaponAssets";
import { IAssetParser } from "../Asset/IAssetParser";
import { WeaponAssetParser } from "../Asset/WeaponAssetParser";
import { WeaponBuilder } from "./WeaponBuilder";

export class BaseWeaponBuilder extends WeaponBuilder<BaseWeapon>{
    protected assetsParser = new WeaponAssetParser()
    protected modelParser = new WeaponModelParser()

    protected CreateWeapon(model: IWeaponModel, config: IWeaponConfig, assetParser: IAssetParser<IWeaponAssets>){
        return new BaseWeapon(model, config, this.createFireModule!, this.assetsParser)
    }
}