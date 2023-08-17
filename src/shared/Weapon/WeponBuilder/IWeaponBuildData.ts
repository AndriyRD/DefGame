import { IFireModule } from "../IFireModule";
import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";

export interface IWeaponBuildData {
    Config: IWeaponConfig | undefined
    WeaponModel: IWeaponModel | undefined
}