import { IAssetParser } from "../Asset/IAssetParser";
import { IPersonWeaponAssets } from "../Asset/IPersonWeaponAssets";
import { PersonWeaponModelParser } from "../ModelParsers/PersonWeaponModelParser";
import { Weapon } from "../Weapon";
import { IPresonWeaponConfig } from "../WeaponConfigurations/IPresonWeaponConfig";
import { IPersonWeaponModel } from "../WeaponModel/IPersonWeaponModel";
import { PersonWeapon } from "../Weapons/PersonWeapon";
import { WeaponBuilder } from "./WeaponBuilder";

export class PersonWeaponBuilder extends WeaponBuilder<PersonWeapon> {
    protected assetsParser = undefined
    protected modelParser = new PersonWeaponModelParser()

    protected CreateWeapon(model: IPersonWeaponModel, config: IPresonWeaponConfig, assetParser: IAssetParser<IPersonWeaponAssets>) {
        return new PersonWeapon(model, config, this.createFireModule!)
    }
}