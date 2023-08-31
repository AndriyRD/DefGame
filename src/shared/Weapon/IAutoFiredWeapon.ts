import { IWeapon } from "./IWeapon"

export interface IAutoFiredWeapon extends IWeapon {
    StartFire(): IAutoFiredWeapon
    StopFire(): IAutoFiredWeapon
}