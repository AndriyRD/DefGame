import { AnimatedCharacter } from "shared/Character/Animation/AnimatedCharacter";
import { AnimationConfig } from "shared/Character/Animation/AnimationConfig";
import { IWrappedEquipment } from "shared/Equipment/IWrappedEquipment";
import { BaseWrappedEquipment } from "shared/Equipment/Wrappers/BaseWrappedEquipment";

export class C_BaseWrapperEquipment extends BaseWrappedEquipment {
    private readonly animatedCharacter = new AnimatedCharacter(
        this.GetOwner(), 
        this.GetConfig().AnimationSet,
        AnimationConfig.DEFAULT_ANIMATION_SET_LIST.R16)

    Equip(): IWrappedEquipment {
        this.animatedCharacter.Load()
        return super.Equip()
    }

    Unequip(): IWrappedEquipment {
        this.animatedCharacter.Reset()
        return super.Unequip()
    }
}