import { AmmoContainer } from "./Ammo/AmmoContainer";
import { IWeaponModel } from "./WeaponModel/IWeaponModel";

export interface IWeaponConstructorObject<T>{
    readonly Owner: Player,
    readonly Name: string,
    readonly Model: IWeaponModel,
    readonly Config: T,
    readonly Ammo: AmmoContainer
}