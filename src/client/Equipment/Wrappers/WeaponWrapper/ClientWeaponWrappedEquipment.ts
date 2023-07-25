import { EQUIPMENT_TYPES } from "shared/Equipment/EQUIPMENTS_TYPES";
import { IWrappedEquipment } from "shared/Equipment/IWrappedEquipment";
import { WeaponProvider } from "client/Weapon/WeaponProvider";
import { WeaponBindModule } from "./WeaponBindModule";
import { AutoFireModule } from "shared/Weapon/AutoFireModule";
import { ClientBaseWrapperEquipment } from "../BaseWrapper/ClientBaseWrapperEquipment";
import { EventProvider } from "client/EventProvider";

export class WeaponWrappedEquipment extends ClientBaseWrapperEquipment{
    private readonly events = EventProvider.Weapon
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
        const ammoContainer = this.weaponContainer.GetWeapon().GetAmmoContainer()
        this.events.Equip.Fire(ammoContainer, ammoContainer.GetState())
        return super.Equip()
    }

    Unequip(): IWrappedEquipment {
        this.bindWeaponModule.Unbind()
        this.events.Unequip.Fire()
        return super.Unequip()
    }
}