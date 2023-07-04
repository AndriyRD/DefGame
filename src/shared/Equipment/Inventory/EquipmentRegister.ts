import { EquipmentWrappManager } from "shared/Equipment/EquipmentWrappManager";
import { IEquipment } from "shared/Equipment/IEquipment";
import { IEquipmentRegister } from "shared/Equipment/Inventory/IEquipmentRegister";

export class EquipmentRegister implements IEquipmentRegister {
    protected readonly wrapManager = new EquipmentWrappManager()
    RegsiterItem(equipment: IEquipment) {
        return this.wrapManager.Wrap(equipment)
    }

    UnregisterItem(equipment: IEquipment) {
        //TODO: Unregister equipment
        return this;
    }
}