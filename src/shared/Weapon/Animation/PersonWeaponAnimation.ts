import { AnimationWithSound } from "shared/Character/Animation/AnimationWithSound";
import { BaseWeaponRelaodAnimation } from "./BaseWeaponRelaodAnimation";
import { AssetInstance } from "shared/AssetInstance/AssetInstance";
import { IPersonWeaponAnimationSet } from "./IPersonWeaponAnimationSet";

export class PersonWeaponAnimation {
    private readonly reloadAnim: BaseWeaponRelaodAnimation;

    PlayReload(){
        this.reloadAnim.Play()
    }

    constructor(
        protected readonly owner: Player,
        protected readonly animationSet: IPersonWeaponAnimationSet,
        protected readonly assets: IPErs){

            this.reloadAnim = new BaseWeaponRelaodAnimation(
                new AnimationWithSound(
                    owner,
                    AssetInstance.CreateByID(animationSet.Relaod, "Animation"),
                    this.weapon.GetAssets().Sounds.Reload),
                weapon.GetWeaponModel()
            )
    }
}