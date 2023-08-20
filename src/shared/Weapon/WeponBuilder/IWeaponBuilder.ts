import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { Weapon } from "../Weapon";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { FireModuleFactory } from "./FireModuleFactoryType";

export interface IWeaponBuilder<ConfigType extends IWeaponConfig, ModelType extends IWeaponModel> {
    SetFireModuleFactory(factory: FireModuleFactory<ModelType>): void
    Build(): Weapon<ConfigType, ModelType>
}