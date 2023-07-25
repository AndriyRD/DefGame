import { AnimatedCharacter } from "shared/Character/Animation/AnimatedCharacter";
import { AnimationConfig } from "shared/Character/Animation/AnimationConfig";
import { IWrappedEquipment } from "shared/Equipment/IWrappedEquipment";
import { BaseWrappedEquipment } from "shared/Equipment/Wrappers/BaseWrappedEquipment";
import { EquipmentAnimation } from "./EquipmentAnimation";

export class ClientBaseWrapperEquipment extends BaseWrappedEquipment {
    private readonly equipmentAnimation = new EquipmentAnimation(
        this.GetCharacter(), 
        this.GetConfig().ActionAnimations)
    private readonly animatedCharacter = new AnimatedCharacter(
        this.GetCharacter(), 
        this.GetConfig().AnimationSet,
        AnimationConfig.DEFAULT_ANIMATION_SET_LIST.R16)

    Equip(): IWrappedEquipment {
        this.equipmentAnimation.PlayEquip()?.Stopped.Connect(() => {
            this.animatedCharacter.Load()
        })
        return super.Equip()
    }

    Unequip(): IWrappedEquipment {
        this.animatedCharacter.Reset()
        return super.Unequip()
    }
}