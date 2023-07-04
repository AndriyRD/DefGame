import { EQUIPMENT_TYPES } from "shared/Equipment/EQUIPMENTS_TYPES";
import { EquipmentRegister } from "shared/Equipment/Inventory/EquipmentRegister";
import { S_WeaponWrappedEquipment } from "./Wrappers/S_WeaponWrappedEquipment.ts";

export class ServerEquipmentRegister extends EquipmentRegister {
    constructor(){
        super()
        this.wrapManager
            .AddFactory(EQUIPMENT_TYPES.WEAPON, (e) => new S_WeaponWrappedEquipment(e))
    }
}