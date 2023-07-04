import { EQUIPMENT_TYPES } from "./EQUIPMENTS_TYPES"
import { IEquipmentConfig } from "./IEquipmentConfig"

export interface IEquipment {
    Equip(): IEquipment
    Unequip(): IEquipment
    IsEquiped(): boolean
    GetModel(): Model
    GetConfig(): IEquipmentConfig
    GetGrip(): Motor6D
    GetOwner(): Player
    GetID(): string
    GetEquipmentType(): keyof typeof EQUIPMENT_TYPES
}