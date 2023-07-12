import { IWeapon } from "../IWeapon";
import { BaseWeaponRelaodAnimation } from "./BaseWeaponRelaodAnimation";

export class WeaponAnimation {
    private readonly reloadAnim: BaseWeaponRelaodAnimation;

    PlayReload(){
        this.reloadAnim.Play()
    }

    constructor(private readonly weapon: IWeapon){
        this.reloadAnim = new BaseWeaponRelaodAnimation(weapon)
    }
}