import { IWeapon } from "./IWeapon";

export interface IReloadebleWeapon extends IWeapon {
    Reload(): void
}