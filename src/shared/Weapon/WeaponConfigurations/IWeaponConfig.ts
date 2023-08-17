import { IAmmoConfig } from "../Ammo/IAmmoConfig";
import { WEAPON_HANDLER_TYPES } from "../WEAPON_HANDLER_TYPES";

export interface IWeaponConfig {
	FireSpeed: number,
	Damage: number,
	HandlerType: WEAPON_HANDLER_TYPES,
	AmmoConfig: IAmmoConfig,
}