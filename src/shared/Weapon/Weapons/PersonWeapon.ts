import { RunService } from "@rbxts/services";
import { BaseWeapon } from "./BaseWeapon";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { PersonWeaponAnimation } from "../Animation/PersonWeaponAnimation";
import { IPresonWeaponConfig } from "../WeaponConfigurations/IPresonWeaponConfig";
import { IPersonWeaponModel } from "../WeaponModel/IPersonWeaponModel";
import { FireModule } from "../FireModule/FireModule";
import { IPersonWeaponAssets } from "../Asset/IPersonWeaponAssets";
import { PersonWeaponAssetParser } from "../Asset/PersonWeaponAssetParser";
import { FireModuleFactory } from "../WeponBuilder/FireModuleFactoryType";
import { Weapon } from "../Weapon";
import { IAssetParser } from "../Asset/IAssetParser";
import { IWeapon } from "../IWeapon";

export class PersonWeapon extends Weapon<IPresonWeaponConfig, IPersonWeaponModel, IPersonWeaponAssets> implements IWeapon{
    private readonly animation: PersonWeaponAnimation

    Reload() {
        if(RunService.IsClient())
            this.animation.PlayReload()
        // return super.Reload()
    }

    constructor(model: IPersonWeaponModel, config: IPresonWeaponConfig, createFireModule: FireModuleFactory<IPersonWeaponModel, IPersonWeaponAssets>){
            super(model, config, createFireModule, new PersonWeaponAssetParser())
            this.animation = new PersonWeaponAnimation(
                this.OwnerState.GetCurrent()!,
                this.config.AnimationSet,
                this.DataObject.Assets,
                this.WeaponModel)
    }
}