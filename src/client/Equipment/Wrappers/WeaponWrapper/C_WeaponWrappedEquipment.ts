import { EQUIPMENT_TYPES } from "shared/Equipment/EQUIPMENTS_TYPES";
import { IWrappedEquipment } from "shared/Equipment/IWrappedEquipment";
import { C_BaseWrapperEquipment } from "../BaseWrapper/C_BaseWrapperEquipment";
import { BindedAutoFireModule } from "../../../Weapon/Common/BindedAutoFireModule";
import { WeaponProvider } from "client/Weapon/WeaponProvider";

export class C_WeaponWrappedEquipment extends C_BaseWrapperEquipment{
    private readonly autoFireModule = new BindedAutoFireModule(
        WeaponProvider.weaponManager.RegisterWeapon(this.GetOwner(), this.GetModel()))

    GetEquipmentType(): EQUIPMENT_TYPES {
        return EQUIPMENT_TYPES.WEAPON
    }

    Equip(): IWrappedEquipment {
        this.autoFireModule.Bind()
        return super.Equip()
    }

    Unequip(): IWrappedEquipment {
        this.autoFireModule.Unbind()
        return super.Unequip()
    }
}