import { BaseWrappedEquipment } from "shared/Equipment/Wrappers/BaseWrappedEquipment";
import { EQUIPMENT_TYPES } from "shared/Equipment/EQUIPMENTS_TYPES";
import { IWrappedEquipment } from "shared/Equipment/IWrappedEquipment";
import { IEquipment } from "shared/Equipment/IEquipment";
import { WeaponServiceAPI } from "server/Weapon/FrontLayer/WeaponServiceAPI";

export class S_WeaponWrappedEquipment extends BaseWrappedEquipment{
    GetEquipmentType(): EQUIPMENT_TYPES {
        return EQUIPMENT_TYPES.WEAPON
    }

    Equip(): IWrappedEquipment {
        return super.Equip()
    }

    constructor(protected readonly equipment: IEquipment){
        super(equipment)
        WeaponServiceAPI.Create(equipment.GetOwner(), equipment.GetModel())
    }
}