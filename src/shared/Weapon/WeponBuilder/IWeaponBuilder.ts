import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { Weapon } from "../Weapon";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { FireModuleFactory } from "./FireModuleFactoryType";
import { IWeaponAssets } from "../Asset/IWeaponAssets";

export interface IWeaponBuilder<ConfigType extends IWeaponConfig, ModelType extends IWeaponModel, AssetsType extends IWeaponAssets> {
    SetFireModuleFactory(factory: FireModuleFactory<ModelType, AssetsType>): void
    Build(): Weapon<ConfigType, ModelType, AssetsType>
}