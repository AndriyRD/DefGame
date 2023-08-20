import { Reflection } from "shared/Reflection";
import { IAssetParser } from "./IAssetParser";
import { IPersonWeaponAssets } from "./IPersonWeaponAssets";
import { WeaponAssetParser } from "./WeaponAssetParser";
import { PERSON_WEAPON_ANIMATION_SOUND_SET_NAMES } from "./PERSON_WEAPON_ANIMATION_SOUND_SET_NAMES";

export class PersonWeaponAssetParser extends WeaponAssetParser implements IAssetParser<IPersonWeaponAssets> {

    protected ParseAnimationSoundSet(dir: Folder, name: PERSON_WEAPON_ANIMATION_SOUND_SET_NAMES){
        const soundSet = new Map<string, Sound>()
        for (const item of dir.GetChildren())
            if(item.IsA('Sound')) soundSet.set(item.Name, item)
        return soundSet
    }
    
    protected ParseAnimatinoSoundSets(name: string){
        const dir = this.FindSoundsDir(name)

        return {
            Equip: this.ParseAnimationSoundSet(dir, PERSON_WEAPON_ANIMATION_SOUND_SET_NAMES.EQUIP),
            Unequip: this.ParseAnimationSoundSet(dir, PERSON_WEAPON_ANIMATION_SOUND_SET_NAMES.UNEQUIP),
            Reload: this.ParseAnimationSoundSet(dir, PERSON_WEAPON_ANIMATION_SOUND_SET_NAMES.RELOAD)
        }
    }

    
    Parse(name: string){
        const baseAssets = super.Parse(name)
        const soundSets = this.ParseAnimatinoSoundSets(name)

        return {
            Particles: baseAssets.Particles,
            Sounds: {
                Fire: baseAssets.Sounds.Fire,
                Equip: soundSets.Equip,
                Unequip: soundSets.Unequip,
                Reload: soundSets.Reload
            }
        }
    }
}