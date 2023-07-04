import { IEquipment } from "../IEquipment"
import { IWrappedEquipment } from "../IWrappedEquipment"

export interface IEquipmentRegister {
    RegsiterItem(equipment: IEquipment): IWrappedEquipment
    UnregisterItem(equipment: IEquipment): IEquipmentRegister
}