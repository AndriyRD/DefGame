import { IWeaponAssets } from "../Asset/IWeaponAssets";
import { FireModule } from "../FireModule/FireModule";
import { WeaponDataObject } from "../WeaponDataObject";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";

export type FireModuleFactory<T extends IWeaponModel, U extends IWeaponAssets> = (model: T) => FireModule<T, U>