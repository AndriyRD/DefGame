import { AnimationWithSound } from "shared/Character/Animation/AnimationWithSound";
import { IWeapon } from "../IWeapon";
import { BaseWeaponRelaodAnimation } from "./BaseWeaponRelaodAnimation";
import { AssetInstance } from "shared/AssetInstance/AssetInstance";

export class WeaponAnimation {
    private readonly reloadAnim: BaseWeaponRelaodAnimation;

    PlayReload(){
        this.reloadAnim.Play()
    }

    constructor(private readonly weapon: IWeapon){
        this.reloadAnim = new BaseWeaponRelaodAnimation(
            new AnimationWithSound(
                this.weapon.GetOwner(),
                AssetInstance.CreateByID(this.weapon.GetConfig().AnimationSet.Relaod, "Animation"),
                this.weapon.GetAssets().Sounds.Reload),
            weapon.GetWeaponModel()
        )
    }
}