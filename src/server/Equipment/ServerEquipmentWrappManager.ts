import { EQUIPMENT_TYPES } from "shared/Equipment/EQUIPMENTS_TYPES";
import { EquipmentWrappManager } from "shared/Equipment/EquipmentWrappManager";
import { IEquipment } from "shared/Equipment/IEquipment";
import { ServerWeaponWrappedEquipment } from "./Wrappers/ServerWeaponWrappedEquipment.ts";

export class ServerEquipmentWrappManager {
    private readonly manager = new EquipmentWrappManager()
    
    Init(){
        this.manager
            .AddFactory(EQUIPMENT_TYPES.WEAPON, e => new ServerWeaponWrappedEquipment(e))
    }

    Wrap(equipment: IEquipment){
        this.manager.Wrap(equipment)
        return equipment
    }
}