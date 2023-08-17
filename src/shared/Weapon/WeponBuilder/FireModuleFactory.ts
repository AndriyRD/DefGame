import { IFireModule } from "../IFireModule";
import { WeaponDataObject } from "../WeaponDataObject";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";

export type FireModuleFactory<T extends IWeaponModel> = (model: T) => IFireModule