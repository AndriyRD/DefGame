import { EQUIPMENT_TYPES } from "shared/Equipment/EQUIPMENTS_TYPES";
import { IWrappedEquipment } from "shared/Equipment/IWrappedEquipment";
import { ClientBaseWrapperEquipment } from "../BaseWrapper/ClientBaseWrapperEquipment";
import { EventProvider } from "client/EventProvider";
import { WeaponProvider } from "client/Weapon/WeaponProvider";
import { PersonWeapon } from "shared/Weapon/Weapons/PersonWeapon";
import { IEquipment } from "shared/Equipment/IEquipment";
import { AutoFiredBindedWeapon } from "client/Weapon/BindedWeapon/AutoFiredBindedWeapon";
import { ReloadebleBindedWeapon } from "client/Weapon/BindedWeapon/ReloadebleBindedWeapon";

export class WeaponWrappedEquipment extends ClientBaseWrapperEquipment{
    private readonly events = EventProvider.Weapon
    private readonly weapon = WeaponProvider.RegisterWeapon<PersonWeapon>(
        this.GetModel())

    private readonly fireBindedWeapon = new AutoFiredBindedWeapon(this.weapon)
    private readonly reloadBindedWeapon = new ReloadebleBindedWeapon(this.weapon)

    GetEquipmentType(): EQUIPMENT_TYPES {
        return EQUIPMENT_TYPES.WEAPON
    }

    Equip(): IWrappedEquipment {
        this.fireBindedWeapon.Bind()
        this.reloadBindedWeapon.Bind()
        const ammoContainer = this.weapon.DataObject.Ammo
        this.events.Equip.Fire(ammoContainer, ammoContainer.GetState())
        return super.Equip()
    }

    Unequip(): IWrappedEquipment {
        this.fireBindedWeapon.Unbind()
        this.reloadBindedWeapon.Unbind()
        this.events.Unequip.Fire()
        return super.Unequip()
    }

    constructor(equipment: IEquipment){
        super(equipment)
        this.weapon.OwnerState.ChagneOwner(equipment.GetOwner())
    }
}