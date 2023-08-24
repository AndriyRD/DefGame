import { IWeaponAssets } from "./Asset/IWeaponAssets";
import { FireModule } from "./FireModule/FireModule";
import { IWeaponModel } from "./WeaponModel/IWeaponModel";
import { WeaponOwnerState } from "./WeaponOwnerState";

export interface IWeapon {
    readonly OwnerState: WeaponOwnerState
    readonly fireModule: FireModule<IWeaponModel, IWeaponAssets>
}