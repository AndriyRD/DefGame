import { IWeaponAssets } from "./IWeaponAssets";

export interface IPersonWeaponAssets extends IWeaponAssets {
    readonly Sounds: {
        Fire: Sound
        Equip: Map<string, Sound>
        Unequip: Map<string, Sound>
        Reload: Map<string, Sound>
    }
}