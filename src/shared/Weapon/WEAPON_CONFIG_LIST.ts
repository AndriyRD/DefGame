import { IWeaponConfig } from "./IWeaponConfig";
import { WEAPON_HANDLER_TYPES } from "./WEAPON_HANDLER_TYPES";

const WEAPON_CONFIG_LIST = new Map<string, IWeaponConfig>()

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
        Relaod: '14044982295'
    }
})

export = WEAPON_CONFIG_LIST