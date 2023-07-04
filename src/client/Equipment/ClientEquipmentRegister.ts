import { EQUIPMENT_TYPES } from "shared/Equipment/EQUIPMENTS_TYPES"
import { EquipmentRegister } from "shared/Equipment/Inventory/EquipmentRegister"
import { C_WeaponWrappedEquipment } from "./Wrappers/WeaponWrapper/C_WeaponWrappedEquipment"

export class ClientEquipmentRegister extends EquipmentRegister {
    constructor(){
        super()
        this.wrapManager
            .AddFactory(EQUIPMENT_TYPES.WEAPON, (e) => new C_WeaponWrappedEquipment(e))
    }
}