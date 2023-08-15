import { IWeaponModel } from "./IWeaponModel";

export interface IPersonWeaponModel extends IWeaponModel {
    readonly Magazine: BasePart,
	readonly CasingSpawn: BasePart
}