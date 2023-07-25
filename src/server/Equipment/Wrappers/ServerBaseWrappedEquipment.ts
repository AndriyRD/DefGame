import GetCharacter from "shared/Character/GetCharacter";
import { EquipmentGlobalConfig } from "shared/Equipment/EquipmentGlobalConfig";
import { IEquipment } from "shared/Equipment/IEquipment";
import { IEquipmentOrientationData } from "shared/Equipment/IEquipmentOrientationData";
import { IWrappedEquipment } from "shared/Equipment/IWrappedEquipment";
import { BaseWrappedEquipment } from "shared/Equipment/Wrappers/BaseWrappedEquipment";

export class ServerBaseWrappedEquipment extends BaseWrappedEquipment{
    protected Reposition(orientationData: IEquipmentOrientationData){
        const grip = this.GetGrip()
        const char = GetCharacter(this.GetOwner())
        const bodyPart = char.WaitForChild(orientationData.BodyPartName) as BasePart

        grip.Part0 = bodyPart
        grip.C0 = orientationData.Offset
        grip.Parent = this.equipment.GetModel().PrimaryPart
    }

    protected InitGrip(){
        const grip = this.GetGrip()
        grip.Name = this.GetID() + EquipmentGlobalConfig.WEAPON_GRIP_NAME_POSTFIX
        grip.Part1 = this.equipment.GetModel().PrimaryPart
        this.Reposition(this.GetConfig().Orientation.Unequip)
    }

    Equip() {
        this.Reposition(this.GetConfig().Orientation.Equip)
        return super.Equip()
    }

    Unequip() {
        this.Reposition(this.GetConfig().Orientation.Unequip)
        return super.Unequip()
    }

    constructor(equipment: IEquipment){
        super(equipment)
        this.InitGrip()
        this.GetModel().Parent = GetCharacter(this.GetOwner())
    }
}