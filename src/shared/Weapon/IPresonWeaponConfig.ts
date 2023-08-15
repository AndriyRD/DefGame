import { IWeaponAnimationSet } from "./Animation/IWeaponAnimationSet";
import { IWeaponConfig } from "./IWeaponConfig";

export interface IPresonWeaponConfig extends IWeaponConfig {
   
    AnimationSet: IWeaponAnimationSet
}