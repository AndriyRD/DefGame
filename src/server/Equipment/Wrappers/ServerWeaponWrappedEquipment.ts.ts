import { EQUIPMENT_TYPES } from "shared/Equipment/EQUIPMENTS_TYPES";
import { IWrappedEquipment } from "shared/Equipment/IWrappedEquipment";
import { IEquipment } from "shared/Equipment/IEquipment";
import { WeaponServiceAPI } from "server/Weapon/FrontLayer/WeaponServiceAPI";
import { ServerBaseWrappedEquipment } from "./ServerBaseWrappedEquipment";

export class ServerWeaponWrappedEquipment extends ServerBaseWrappedEquipment{
    GetEquipmentType(): EQUIPMENT_TYPES {
        return EQUIPMENT_TYPES.WEAPON
    }

    Equip(): IWrappedEquipment {
        return super.Equip()
    }

    constructor(protected readonly equipment: IEquipment){
        super(equipment)
        WeaponServiceAPI.Create(equipment.GetModel())
    }
}