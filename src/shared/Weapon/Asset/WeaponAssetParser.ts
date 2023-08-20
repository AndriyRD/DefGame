import { ReplicatedStorage } from "@rbxts/services";
import { IWeaponAssets } from "./IWeaponAssets";
const weaponDir = ReplicatedStorage.WaitForChild('Weapon') as Folder

export class WeaponAssetParser {
    protected readonly ASSET_DIR = weaponDir.WaitForChild('Assets') as Folder
    protected readonly COMMON_ASSETS_DIR = this.ASSET_DIR.WaitForChild('Common')
    protected readonly options = {
        SoundDirName: 'Sounds',
        FireSoundName: 'Fire',
        CommonParticlesDir: this.COMMON_ASSETS_DIR.WaitForChild('Particles')
    }

    protected GetAssetsDir(name: string){
        return this.ASSET_DIR.WaitForChild(name) as Folder
    }

    protected GetSoundsDir(assetsDir: Folder){
        return assetsDir.WaitForChild(this.options.SoundDirName) as Folder
    }

    protected FindSoundsDir(name: string){
        const soundsDir = this.GetSoundsDir(this.GetAssetsDir(name))
        if (!soundsDir) error(`Not found sound-directory in assets for: ${name}`)
        return soundsDir
    }

    protected ParseParticles(){
        return {
            FireSmoke: this.options
                .CommonParticlesDir.WaitForChild('FireSmoke').GetChildren() as ParticleEmitter[]
        }
    }

    Parse(name: string): IWeaponAssets{
        const particles = this.ParseParticles()
        const soundsDir = this.FindSoundsDir(name)
        const fireSound = soundsDir.WaitForChild('Fire') as Sound
        if (!fireSound) error(`Not found weapon fire sound for ${name}`)

        return {
            Sounds: {
                Fire: soundsDir.WaitForChild('Fire') as Sound,
                // Equip: sounds.get('Equip')!,
                // Unequip: sounds.get('Unequip')!,
                // Reload: sounds.get('Reload')!
            },

            Particles:{
                FireSmoke: particles.FireSmoke
            }
        }
    }
}