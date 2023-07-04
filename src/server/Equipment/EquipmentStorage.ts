import { PlayerStorageContainer } from "server/Core/PlayerStorage/PlayerStorageContainer";
import { Equipment } from "shared/Equipment/Equipment";
import { EquipmentFactory } from "shared/Equipment/EquipmentFactory";
import { IEquipment } from "shared/Equipment/IEquipment";

export class EquipmentStorage extends PlayerStorageContainer<string, IEquipment> {
    AddEquipment(equipment: IEquipment){
        this.AddItem(equipment.GetOwner(), equipment.GetID(), equipment)
        return equipment
    }
}