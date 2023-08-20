import { IWeaponAssets } from "./IWeaponAssets";

export interface IAssetParser<T extends IWeaponAssets>{
    Parse(name: string): T
}