export interface IWeaponAssets {
    readonly Sounds: {
        Fire: Sound
        Equip: Map<string, Sound>
        Unequip: Map<string, Sound>
        Reload: Map<string, Sound>
    }

    readonly Particles: {
        FireSmoke: ParticleEmitter[]
    }
}