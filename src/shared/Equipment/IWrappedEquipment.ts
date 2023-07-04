import { EQUIPMENT_TYPES } from "./EQUIPMENTS_TYPES"
import { IEquipment } from "./IEquipment"

export interface IWrappedEquipment extends IEquipment {
    GetEquipmentType(): EQUIPMENT_TYPES
}