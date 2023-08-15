import { IWeaponAssets } from "./Asset/IWeaponAssets"
import { WeaponState } from "./WeaponState"

export interface IWeapon<ConfigType, ModelType>{
    readonly State: WeaponState
    readonly WeaponModel: ModelType
    GetName(): string
    GetConfig(): ConfigType
    GetAssets(): IWeaponAssets
    ChangeFireState(val: boolean): boolean
}