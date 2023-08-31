import { IWeaponModel } from "./WeaponModel/IWeaponModel";
import { WeaponOwnerState } from "./WeaponOwnerState";

export interface IWeapon {
    readonly OwnerState: WeaponOwnerState
    readonly WeaponModel: IWeaponModel
    GetId(): string
    GetModelID(): number
    Fire(): void
}