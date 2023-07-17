import { AnimationWithSound } from "shared/Character/Animation/AnimationWithSound";
import { IWeapon } from "../IWeapon";
import { BaseWeaponRelaodAnimation } from "./BaseWeaponRelaodAnimation";
import { AnimationUtility } from "shared/Character/Animation/AnmationUtility";

export class WeaponAnimation {
    private readonly reloadAnim: BaseWeaponRelaodAnimation;

    PlayReload(){
        this.reloadAnim.Play()
    }

    constructor(private readonly weapon: IWeapon){
        this.reloadAnim = new BaseWeaponRelaodAnimation(
            new AnimationWithSound(
                this.weapon.GetOwner(),
                AnimationUtility.CreateByID(this.weapon.GetConfig().AnimationSet.Relaod),
                this.weapon.GetAssets().Sounds.Relaod),
            weapon.GetWeaponModel()
        )
    }
}