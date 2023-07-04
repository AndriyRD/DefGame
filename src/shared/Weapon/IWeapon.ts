import { AmmoContainer } from "./Ammo/AmmoContainer"
import { IWeaponConfig } from "./IWeaponConfig"
import { IWeaponModel } from "./IWeaponModel"

export interface IWeapon {
    GetName(): string
    GetOwner(): Player
    GetWeaponModel(): IWeaponModel
    GetConfig(): IWeaponConfig
    GetAmmoContainer(): AmmoContainer
    GetFireDelay(): number
    // GetAssets(): 
}