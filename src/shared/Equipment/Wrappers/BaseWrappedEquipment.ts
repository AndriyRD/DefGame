import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { EQUIPMENT_TYPES } from "../EQUIPMENTS_TYPES";
import { IEquipment } from "../IEquipment";
import { IEquipmentConfig } from "../IEquipmentConfig";
import { IWrappedEquipment } from "../IWrappedEquipment";

export class BaseWrappedEquipment implements IWrappedEquipment {
    GetEquipmentType(): EQUIPMENT_TYPES {
        return EQUIPMENT_TYPES.DEFAULT;
    }
    GetCharacter(): ReloadableCharacter {
        return this.equipment.GetCharacter()
    }
    Equip(): IWrappedEquipment {
        this.equipment.Equip();
        return this
    }
    Unequip(): IWrappedEquipment {
        this.equipment.Unequip();
        return this
    }
    GetModel(): Model {
        return this.equipment.GetModel();
    }
    GetConfig(): IEquipmentConfig {
        return this.equipment.GetConfig();
    }
    GetGrip(): Motor6D {
        return this.equipment.GetGrip();
    }
    GetOwner(): Player {
        return this.equipment.GetOwner();
    }
    GetID(): string {
        return this.equipment.GetID();
    }
    IsEquiped(): boolean {
        return this.equipment.IsEquiped();
    }
    constructor(protected readonly equipment: IEquipment){}
    
}