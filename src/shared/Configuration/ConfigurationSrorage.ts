import { IWeaponConfig } from "shared/Weapon/WeaponConfigurations/IWeaponConfig";
import { Configuration } from "./Configuration";
import { WEAPON_HANDLER_TYPES } from "shared/Weapon/WEAPON_HANDLER_TYPES";
import { WEAPON_CLASSES } from "shared/Weapon/WEAPON_CLASSES";

export class ConfigurationSrorage{
    static readonly WeaponConfiguration = new Configuration<IWeaponConfig>({
        AK47: {
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
        },

        RocketLauncher: {
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
        },
        MachineGun: {
            Damage: 7,
            FireSpeed: 20,
            HandlerType: WEAPON_HANDLER_TYPES.BASE,
            AmmoConfig: {
                MagazineSize: 180,
                MaxAmmo: 180
            },
            WeaponClass: WEAPON_CLASSES.DEFAULT
        }
    })
}