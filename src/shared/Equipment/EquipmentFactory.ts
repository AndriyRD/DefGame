import { ReplicatedStorage } from "@rbxts/services";
import { Equipment } from "./Equipment";
import EQUIPMENT_CONFIG_LIST from "./EQUIPMENT_CONFIG_LIST";
import { IEquipmentConfig } from "./IEquipmentConfig";
import GetCharacter from "shared/Character/GetCharacter";
import { EquipmentGlobalConfig } from "./EquipmentGlobalConfig";
const equipmentDir = ReplicatedStorage.WaitForChild('Equipment')
const models = equipmentDir.WaitForChild('Models') as Folder

export type CreateEquipmentOptionData = {Model: Model, Grip: Motor6D}

export class EquipmentFactory {
    static WEAPON_GRIP_NAME_POSTFIX: string;
    Create(owner: Player, name: string, option: CreateEquipmentOptionData | undefined){
        let equipmentModel = undefined
        if (!option){
            const originModel = models.FindFirstChild(name) as Model
            if (!originModel) error(`Not found equipment-model for: ${name}`)
            equipmentModel = originModel.Clone()
            equipmentModel.Parent = GetCharacter(owner)
        } else equipmentModel = option.Model

        let grip = undefined
        if(!option){
            grip = new Instance('Motor6D', equipmentModel.PrimaryPart)
            if(!grip) error(`Not found grip in equipment: ${name}`)
        } else grip = option.Grip

        const config = EQUIPMENT_CONFIG_LIST.get(name) as IEquipmentConfig
        if (!config) error(`Not found config for equipment: ${name}`)

        return new Equipment(name, owner, equipmentModel, config, grip)
    }
}