import { EQUIPMENT_TYPES } from "shared/Equipment/EQUIPMENTS_TYPES";
import { IWrappedEquipment } from "shared/Equipment/IWrappedEquipment";
import { WeaponProvider } from "client/Weapon/WeaponProvider";
import { WeaponBindModule } from "./WeaponBindModule";
import { AutoFireModule } from "shared/Weapon/AutoFireModule";
import { ClientBaseWrapperEquipment } from "../BaseWrapper/ClientBaseWrapperEquipment";

export class WeaponWrappedEquipment extends ClientBaseWrapperEquipment{
    private readonly weaponContainer = WeaponProvider.weaponManager.RegisterWeapon(
        this.GetOwner(),
        this.GetModel())

    private readonly bindWeaponModule = new WeaponBindModule(
        this.weaponContainer.GetWeapon(),
        new AutoFireModule(this.weaponContainer))

    GetEquipmentType(): EQUIPMENT_TYPES {
        return EQUIPMENT_TYPES.WEAPON
    }

    Equip(): IWrappedEquipment {
        this.bindWeaponModule.Bind()
        return super.Equip()
    }

    Unequip(): IWrappedEquipment {
        this.bindWeaponModule.Unbind()
        return super.Unequip()
    }
}