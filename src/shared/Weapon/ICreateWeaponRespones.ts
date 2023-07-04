import { IWeaponConfig } from "./IWeaponConfig";

export interface ICreateWeaponRespones {
    Model: Model,
    Config: IWeaponConfig,
    Name: string
}