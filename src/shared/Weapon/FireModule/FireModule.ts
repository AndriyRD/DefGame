import { WeaponDataObject } from "../WeaponDataObject"
import { IHitHandler } from "./IHitHandler"
import { IWeaponModel } from "../WeaponModel/IWeaponModel"

export abstract class FireModule<T extends IWeaponModel>{
    protected readonly abstract hitHandler: IHitHandler
    abstract Fire():void

    constructor(
        protected readonly currentOwner: Player,
        readonly weponData: WeaponDataObject,
        readonly weponModel: T){}
}