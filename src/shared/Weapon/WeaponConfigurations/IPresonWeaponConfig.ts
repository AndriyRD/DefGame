import { IPersonWeaponAnimationSet } from "../Animation/IPersonWeaponAnimationSet";
import { IWeaponConfig } from "./IWeaponConfig";

export interface IPresonWeaponConfig extends IWeaponConfig {
    AnimationSet: IPersonWeaponAnimationSet
}