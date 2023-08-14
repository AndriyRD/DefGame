import { ReplicatedStorage } from "@rbxts/services";
import { IWeaponAssets } from "./IWeaponAssets";
const weaponDir = ReplicatedStorage.WaitForChild('Weapon') as Folder

export class WeaponAssetParser {
    private static readonly ASSET_DIR = weaponDir.WaitForChild('Assets') as Folder
    private static readonly COMMON_ASSETS_DIR = WeaponAssetParser.ASSET_DIR.WaitForChild('Common')
    private static readonly options = {
        SoundDirName: 'Sounds',
        SoundsForAnimations: [
            'Reload',
            'Equip',
            'Unequip'
        ],
        FireSoundName: 'Fire',
        CommonParticlesDir: WeaponAssetParser.COMMON_ASSETS_DIR.WaitForChild('Particles')
    }

    private static ParseSounds(soundsDir: Folder){
        const sounds = new Map<string, Map<string, Sound>>()

        for (const dirName of WeaponAssetParser.options.SoundsForAnimations) {
            const soundDir = soundsDir.WaitForChild(dirName) as Folder
            if (soundDir){
                const soundSet = new Map<string, Sound>()
                for (const item of soundDir.GetChildren()) {
                    if(item.IsA('Sound')){
                        soundSet.set(item.Name, item)
                    }
                }
                sounds.set(dirName, soundSet)
            }
        }

        return sounds
    }

    private static ParseParticles(){
        return {
            FireSmoke: WeaponAssetParser.options
                .CommonParticlesDir.WaitForChild('FireSmoke').GetChildren() as ParticleEmitter[]
        }
    }

    static Parse(name: string): IWeaponAssets{
        const assetsDir = WeaponAssetParser.ASSET_DIR.WaitForChild(name) as Folder
        const soundsDir = assetsDir.WaitForChild(WeaponAssetParser.options.SoundDirName) as Folder
        if (!soundsDir) error(`Not found sound-directory in assets for: ${assetsDir}`)
        const sounds = WeaponAssetParser.ParseSounds(soundsDir)
        const particles = WeaponAssetParser.ParseParticles()

        return {
            Sounds: {
                Fire: soundsDir.WaitForChild(WeaponAssetParser.options.FireSoundName) as Sound,
                Equip: sounds.get('Equip')!,
                Unequip: sounds.get('Unequip')!,
                Reload: sounds.get('Reload')!
            },

            Particles:{
                FireSmoke: particles.FireSmoke
            }
        }
    }
}