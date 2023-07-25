import { EQUIPMENT_TYPES } from "shared/Equipment/EQUIPMENTS_TYPES";
import { EquipmentRegister } from "shared/Equipment/Inventory/EquipmentRegister";
import { ServerWeaponWrappedEquipment } from "./Wrappers/ServerWeaponWrappedEquipment.ts";

export class ServerEquipmentRegister extends EquipmentRegister {
    constructor(){
        super()
        this.wrapManager
            .AddFactory(EQUIPMENT_TYPES.WEAPON, (e) => new ServerWeaponWrappedEquipment(e))
    }
}