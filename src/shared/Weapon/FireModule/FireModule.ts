import { WeaponDataObject } from "../WeaponDataObject"
import { IHitHandler } from "./IHitHandler"
import { IWeaponModel } from "../WeaponModel/IWeaponModel"
import { IWeaponAssets } from "../Asset/IWeaponAssets"
import { IAssetParser } from "../Asset/IAssetParser"

export abstract class FireModule<T extends IWeaponModel, U extends IWeaponAssets>{
    protected readonly abstract hitHandler: IHitHandler
    abstract Fire():void

    constructor(
        protected readonly currentOwner: Player,
        readonly weaponData: WeaponDataObject<U>,
        readonly weponModel: T){}
}