import { RunService } from "@rbxts/services";
import { BaseWeapon } from "./BaseWeapon";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { PersonWeaponAnimation } from "../Animation/PersonWeaponAnimation";
import { IPresonWeaponConfig } from "../WeaponConfigurations/IPresonWeaponConfig";
import { IPersonWeaponModel } from "../WeaponModel/IPersonWeaponModel";
import { FireModule } from "../FireModule/FireModule";
import { IPersonWeaponAssets } from "../Asset/IPersonWeaponAssets";
import { PersonWeaponAssetParser } from "../Asset/PersonWeaponAssetParser";

export class PersonWeapon extends BaseWeapon<IPresonWeaponConfig, IPersonWeaponModel, IPersonWeaponAssets>{
    private readonly animation: PersonWeaponAnimation

    Reload() {
        if(RunService.IsClient())
            this.animation.PlayReload()
        return super.Reload()
    }

    constructor(model: IPersonWeaponModel, config: IPresonWeaponConfig, fireModule: FireModule<IPersonWeaponModel, IPersonWeaponAssets>){
            super(model, config, fireModule, new PersonWeaponAssetParser())
            this.animation = new PersonWeaponAnimation(
                this.OwnerState.GetCurrent()!,
                this.config.AnimationSet,
                this.DataObject.Assets,
                this.WeaponModel)
    }
}