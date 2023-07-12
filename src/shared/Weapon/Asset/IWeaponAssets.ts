export interface IWeaponAssets {
    readonly Sounds: {
        Fire: Sound
        Equip: Map<string, Sound>
        Unequip: Map<string, Sound>
        Relaod: Map<string, Sound>
    }
}