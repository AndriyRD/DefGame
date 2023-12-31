import { EQUIPMENT_TYPES } from "shared/Equipment/EQUIPMENTS_TYPES"
import { EquipmentRegister } from "shared/Equipment/Inventory/EquipmentRegister"
import { WeaponWrappedEquipment } from "./Wrappers/WeaponWrapper/ClientWeaponWrappedEquipment"

export class ClientEquipmentRegister extends EquipmentRegister {
    constructor(){
        super()
        this.wrapManager
            .AddFactory(EQUIPMENT_TYPES.WEAPON, (e) => new WeaponWrappedEquipment(e))
    }
}