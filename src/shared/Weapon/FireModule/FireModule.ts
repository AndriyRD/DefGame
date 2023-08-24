import { WeaponDataObject } from "../WeaponDataObject"
import { IHitHandler } from "./IHitHandler"
import { IWeaponModel } from "../WeaponModel/IWeaponModel"
import { IWeaponAssets } from "../Asset/IWeaponAssets"

export abstract class FireModule<T extends IWeaponModel, U extends IWeaponAssets>{
    protected readonly abstract hitHandler: IHitHandler
    protected currentOwner: Player | undefined

    abstract Fire():void
    
    abstract Dispose(): void

    GetCurrentOwner = () => this.currentOwner

    CanFire = () => this.currentOwner !== undefined

    OnChagneOwner(owner: Player){
        this.currentOwner = owner
        return this
    }

    OnRemoveOwner(){
        this.currentOwner = undefined
    }

    constructor(
        readonly weaponData: WeaponDataObject<U>,
        readonly weponModel: T){}
}