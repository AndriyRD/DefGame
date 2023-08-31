import { IdentifiedInstance } from "shared/IdentifiedInstance";

export interface IWeaponModel{
	readonly Model: IdentifiedInstance<Model>,
	readonly Muzzle: BasePart,
	readonly CasingSpawn: BasePart
}