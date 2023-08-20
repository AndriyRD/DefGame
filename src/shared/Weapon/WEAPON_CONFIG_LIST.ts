import { IWeaponConfig } from "./WeaponConfigurations/IWeaponConfig";
import { WEAPON_HANDLER_TYPES } from "./WEAPON_HANDLER_TYPES";
import { WEAPON_CLASSES } from "./WEAPON_CLASSES";

const WEAPON_CONFIG_LIST = new Map<string, IWeaponConfig>()

WEAPON_CONFIG_LIST.set('AK47', {
    Damage: 7,
    FireSpeed: 7,
    HandlerType: WEAPON_HANDLER_TYPES.BASE,
    AmmoConfig: {
        MagazineSize: 30,
        MaxAmmo: 180
    },
    WeaponClass: WEAPON_CLASSES.PERSON_WEAPOM,
    AnimationSet: {
        Equip: '',
        Unequip: '',
        Relaod: '14110068229'
    }
}as IWeaponConfig)

WEAPON_CONFIG_LIST.set('RocketLauncher', {
    Damage: 110,
    FireSpeed: 2,
    HandlerType: WEAPON_HANDLER_TYPES.BASE,
    AmmoConfig: {
        MagazineSize: 1,
        MaxAmmo: 10
    },
    WeaponClass: WEAPON_CLASSES.PERSON_WEAPOM,
    AnimationSet: {
        Equip: '',
        Unequip: '',
        Relaod: '14085080526'
    }
}as IWeaponConfig & any)

WEAPON_CONFIG_LIST.set('MachineGun', {
    Damage: 7,
    FireSpeed: 20,
    HandlerType: WEAPON_HANDLER_TYPES.BASE,
    AmmoConfig: {
        MagazineSize: 180,
        MaxAmmo: 180
    },
    WeaponClass: WEAPON_CLASSES.DEFAULT
})

export = WEAPON_CONFIG_LIST