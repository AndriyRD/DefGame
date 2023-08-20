import { IWeaponConfig } from "./WeaponConfigurations/IWeaponConfig";
import { WEAPON_HANDLER_TYPES } from "./WEAPON_HANDLER_TYPES";

const WEAPON_CONFIG_LIST = new Map<string, IWeaponConfig & any>()

WEAPON_CONFIG_LIST.set('AK47', {
    Damage: 7,
    FireSpeed: 7,
    HandlerType: WEAPON_HANDLER_TYPES.BASE,
    AmmoConfig: {
        MagazineSize: 30,
        MaxAmmo: 180
    },
    AnimationSet: {
        Equip: '',
        Unequip: '',
        Relaod: '14110068229'
    }
})

WEAPON_CONFIG_LIST.set('RocketLauncher', {
    Damage: 110,
    FireSpeed: 2,
    HandlerType: WEAPON_HANDLER_TYPES.BASE,
    AmmoConfig: {
        MagazineSize: 1,
        MaxAmmo: 10
    },
    AnimationSet: {
        Equip: '',
        Unequip: '',
        Relaod: '14085080526'
    }
})

WEAPON_CONFIG_LIST.set('MachineGun', {
    Damage: 7,
    FireSpeed: 20,
    HandlerType: WEAPON_HANDLER_TYPES.BASE,
    AmmoConfig: {
        MagazineSize: 180,
        MaxAmmo: 180
    },
})

export = WEAPON_CONFIG_LIST