import { FireModule } from "../FireModule/FireModule";
import { WeaponDataObject } from "../WeaponDataObject";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";

export type FireModuleFactory<T extends IWeaponModel> = (model: T) => FireModule<T>