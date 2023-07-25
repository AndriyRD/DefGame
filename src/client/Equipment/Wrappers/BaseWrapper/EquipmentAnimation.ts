import { AssetInstance } from "shared/AssetInstance/AssetInstance";
import { AnimationFactory } from "shared/Character/Animation/AnimationFactory";
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { IEquipmentActionAnimations } from "shared/Equipment/Animation/IEquipmentActionAnimations";
import { IEquipmentAnimationData } from "shared/Equipment/Animation/IEquipmentAnimationData";
import { IEquipmentSound } from "shared/Equipment/Animation/IEquipmentSound";

export class EquipmentAnimation {
    private readonly equipAnimation
    private readonly unequipAnimation

    private ConvertSoundSet(sounds: [IEquipmentSound]){
        const soundSet = new Map<string, Sound>()
        for (const item of sounds)
            soundSet.set(item.Name, AssetInstance.CreateByID(item.ID, "Sound"))
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
        }
}