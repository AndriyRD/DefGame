import { IFireModule } from "../IFireModule";
import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { Weapon } from "../Weapon";
import { WeaponDataObject } from "../WeaponDataObject";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { FireModuleFactory } from "./FireModuleFactory";

export interface IWeaponBuilder<ConfigType extends IWeaponConfig, ModelType extends IWeaponModel> {
    SetFireModuleFactory(factory: FireModuleFactory<ModelType>): void
    Build(): Weapon<ConfigType, ModelType>
}