import { AssetInstance } from "shared/AssetInstance/AssetInstance";
import { AnimationFactory } from "shared/Character/Animation/AnimationFactory";
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { IEquipmentActionAnimations } from "shared/Equipment/Animation/IEquipmentActionAnimations";
import { IEquipmentAnimationData } from "shared/Equipment/Animation/IEquipmentAnimationData";
import { IEquipmentSound } from "shared/Equipment/Animation/IEquipmentSound";

export class EquipmentAnimation {
    private readonly equipAnimation
    private readonly unequipAnimation
    private readonly soundContainer = new Instance('Folder')

    private ConvertSoundSet(sounds: [IEquipmentSound]){
        const soundSet = new Map<string, Sound>()
        for (const item of sounds){
            const sound = AssetInstance.CreateByID<Sound>(item.ID, "Sound")
            sound.Parent = this.character.GetRoot()
            sound.Name = item.Name
            sound.Parent = this.soundContainer
            soundSet.set(item.Name, sound)
        }

        return soundSet
    }

    private CreateActionAnimation(data: IEquipmentAnimationData){
        return AnimationFactory.CraeteWithSoundByID(
            this.character,
            data.AnimationID,
            this.ConvertSoundSet(data.Sounds))
    }

    PlayEquip(){
        this.equipAnimation.Play()
        return this.equipAnimation.GetTrack()
    }

    PlayeUnequip(){
        this.unequipAnimation.Play()
        return this.unequipAnimation.GetTrack()
    }

    constructor(
        private readonly character: ReloadableCharacter,
        private readonly actionAnimations: IEquipmentActionAnimations){
            this.equipAnimation = this.CreateActionAnimation(actionAnimations.Equip)
            this.unequipAnimation = this.CreateActionAnimation(actionAnimations.Uneqip)

            this.soundContainer.Parent = character.GetRoot()
            this.soundContainer.Name = "SoundContainer"
        }
}