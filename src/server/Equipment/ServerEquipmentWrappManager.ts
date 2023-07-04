import { EQUIPMENT_TYPES } from "shared/Equipment/EQUIPMENTS_TYPES";
import { EquipmentWrappManager } from "shared/Equipment/EquipmentWrappManager";
import { S_WeaponWrappedEquipment } from "./Wrappers/S_WeaponWrappedEquipment.ts";
import { IEquipment } from "shared/Equipment/IEquipment";

export class ServerEquipmentWrappManager {
    private readonly manager = new EquipmentWrappManager()
    
    Init(){
        this.manager
            .AddFactory(EQUIPMENT_TYPES.WEAPON, e => new S_WeaponWrappedEquipment(e))
    }

    Wrap(equipment: IEquipment){
        this.manager.Wrap(equipment)
        return equipment
    }
}