import { IWeaponModel } from "../WeaponModel/IWeaponModel";

export interface IWeaponModelParser<T extends IWeaponModel>{
    Parse(model: Model): T
}