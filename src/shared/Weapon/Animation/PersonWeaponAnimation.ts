import { AnimationWithSound } from "shared/Character/Animation/AnimationWithSound";
import { BaseWeaponRelaodAnimation } from "./BaseWeaponRelaodAnimation";
import { AssetInstance } from "shared/AssetInstance/AssetInstance";
import { IPersonWeaponAnimationSet } from "./IPersonWeaponAnimationSet";
import { IPersonWeaponAssets } from "../Asset/IPersonWeaponAssets";
import { IPersonWeaponModel } from "../WeaponModel/IPersonWeaponModel";

export class PersonWeaponAnimation {
    private readonly reloadAnim: BaseWeaponRelaodAnimation;

    PlayReload(){
        this.reloadAnim.Play()
    }

    constructor(
        protected readonly owner: Player,
        protected readonly animationSet: IPersonWeaponAnimationSet,
        protected readonly assets: IPersonWeaponAssets,
        protected readonly model: IPersonWeaponModel){

            this.reloadAnim = new BaseWeaponRelaodAnimation(
                new AnimationWithSound(
                    owner,
                    AssetInstance.CreateByID(animationSet.Relaod, "Animation"),
                    this.assets.Sounds.Reload),
                this.model
            )
    }
}