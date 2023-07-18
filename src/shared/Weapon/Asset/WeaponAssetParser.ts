import { ReplicatedStorage } from "@rbxts/services";
import { IWeaponAssets } from "./IWeaponAssets";
const weaponDir = ReplicatedStorage.WaitForChild('Weapon') as Folder

export class WeaponAssetParser {
    private static readonly ASSET_DIR = weaponDir.WaitForChild('Assets') as Folder
    private static readonly options = {
        SoundDirName: 'Sounds',
        SoundsForAnimations: [
            'Reload',
            'Equip',
            'Unequip'
        ],
        FireSoundName: 'Fire'
    }

    private static ParseSounds(soundsDir: Folder){
        const sounds = new Map<string, Map<string, Sound>>()

        for (const dirName of this.options.SoundsForAnimations) {
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

    static Parse(name: string){
        const assetsDir = this.ASSET_DIR.WaitForChild(name) as Folder
        const soundsDir = assetsDir.WaitForChild(this.options.SoundDirName) as Folder
        if (!soundsDir) error(`Not found sound-directory in assets for: ${assetsDir}`)
        const sounds = this.ParseSounds(soundsDir)

        return {
            Sounds: {
                Fire: soundsDir.WaitForChild(this.options.FireSoundName) as Sound,
                Equip: sounds.get('Equip'),
                Unequip: sounds.get('Unequip'),
                Reload: sounds.get('Reload')
            }
        }
    }
}