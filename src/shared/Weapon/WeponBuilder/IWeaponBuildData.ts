import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";

export interface IWeaponBuildData<T extends IWeaponConfig, U extends IWeaponModel> {
    Config: T | undefined
    WeaponModel: U | undefined
    Owner: Player | undefined
}