import { EQUIPMENT_TYPES } from "shared/Equipment/EQUIPMENTS_TYPES";
import { IWrappedEquipment } from "shared/Equipment/IWrappedEquipment";
import { ClientBaseWrapperEquipment } from "../BaseWrapper/ClientBaseWrapperEquipment";
import { EventProvider } from "client/EventProvider";
import { WeaponProvider } from "client/Weapon/WeaponProvider";
import { AutoFire } from "shared/Weapon/FireModule/AutoFire";
import { PersonWeapon } from "shared/Weapon/Weapons/PersonWeapon";
import { IEquipment } from "shared/Equipment/IEquipment";
import { BindedWeapon } from "client/Weapon/BindedWeapon";

export class WeaponWrappedEquipment extends ClientBaseWrapperEquipment{
    private readonly events = EventProvider.Weapon
    private readonly weapon = WeaponProvider.RegisterWeapon<PersonWeapon>(
        this.GetModel())

    private readonly bindWeaponModule = new BindedWeapon(
        this.weapon as any,
        new AutoFire(this.weapon.fireModule))

    GetEquipmentType(): EQUIPMENT_TYPES {
        return EQUIPMENT_TYPES.WEAPON
    }

    Equip(): IWrappedEquipment {
        this.bindWeaponModule.Bind()
        const ammoContainer = this.weapon.DataObject.Ammo
        this.events.Equip.Fire(ammoContainer, ammoContainer.GetState())
        return super.Equip()
    }

    Unequip(): IWrappedEquipment {
        this.bindWeaponModule.Unbind()
        this.events.Unequip.Fire()
        return super.Unequip()
    }

    constructor(equipment: IEquipment){
        super(equipment)
        this.weapon.OwnerState.ChagneOwner(equipment.GetOwner())
    }
}