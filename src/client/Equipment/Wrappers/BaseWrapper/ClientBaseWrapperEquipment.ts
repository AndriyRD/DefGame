import { AnimatedCharacter } from "shared/Character/Animation/AnimatedCharacter";
import { AnimationConfig } from "shared/Character/Animation/AnimationConfig";
import { IWrappedEquipment } from "shared/Equipment/IWrappedEquipment";
import { BaseWrappedEquipment } from "shared/Equipment/Wrappers/BaseWrappedEquipment";
import { EquipmentAnimation } from "./EquipmentAnimation";
import { IEquipment } from "shared/Equipment/IEquipment";

export class ClientBaseWrapperEquipment extends BaseWrappedEquipment {
    private readonly equipmentAnimation: EquipmentAnimation
    private readonly animatedCharacter: AnimatedCharacter

    Equip(): IWrappedEquipment {
        this.equipmentAnimation.PlayEquip()?.Stopped.Connect(() =>
            this.animatedCharacter.Load()
        )
        return super.Equip()
    }

    Unequip(): IWrappedEquipment {
        this.equipmentAnimation.PlayeUnequip()?.Stopped.Connect(() =>
            this.animatedCharacter.Reset()
        )
        super.Unequip()
        return this
    }

    constructor(equipment: IEquipment){
        super(equipment)
        const char = this.GetCharacter()
        const config = this.GetConfig()

        this.equipmentAnimation = new EquipmentAnimation(
            char, 
            config.ActionAnimations)

        this.animatedCharacter = new AnimatedCharacter(
            char, 
            config.AnimationSet,
            AnimationConfig.DEFAULT_ANIMATION_SET_LIST.R16)
    }
}