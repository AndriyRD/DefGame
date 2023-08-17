import { AnimationWithSound } from "shared/Character/Animation/AnimationWithSound";
import { IWeapon } from "../Weapon";
import { BaseWeaponRelaodAnimation } from "./BaseWeaponRelaodAnimation";
import { AssetInstance } from "shared/AssetInstance/AssetInstance";
import { PersonWeapon } from "../PersonWeapon";

export class PersonWeaponAnimation {
    private readonly reloadAnim: BaseWeaponRelaodAnimation;

    PlayReload(){
        this.reloadAnim.Play()
    }

    constructor(private readonly weapon: PersonWeapon){
        this.reloadAnim = new BaseWeaponRelaodAnimation(
            new AnimationWithSound(
                this.weapon.GetOwner(),
                AssetInstance.CreateByID(this.weapon.GetConfig().AnimationSet.Relaod, "Animation"),
                this.weapon.GetAssets().Sounds.Reload),
            weapon.GetWeaponModel()
        )
    }
}