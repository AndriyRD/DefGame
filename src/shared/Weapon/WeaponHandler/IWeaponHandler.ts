import { IFireHandler } from "./IFireHandler";
import { IHitHandler } from "./IHitHandler";

export interface IWeaponHandler {
    readonly FireHandler: IFireHandler
    readonly HitWandler: IHitHandler
}