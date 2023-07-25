import { AssetInstance } from "shared/AssetInstance/AssetInstance";
import { ReloadableAnimation } from "./ReloadableAnimation";
import { ReloadableCharacter } from "../ReloadableCharacter";
import { AnimationWithSound } from "./AnimationWithSound";

export class AnimationFactory {
    static CreateReloadebleByID(owner: Player | ReloadableCharacter, id: string){
        return new ReloadableAnimation(owner, AssetInstance.CreateByID<Animation>(id, "Animation"))
    }

    static CraeteWithSoundByID(owner: Player | ReloadableCharacter, id: string, soundSet: Map<string, Sound>){
        return new AnimationWithSound(
            owner, 
            AssetInstance.CreateByID<Animation>(id, "Animation"),
            soundSet)
    }
}