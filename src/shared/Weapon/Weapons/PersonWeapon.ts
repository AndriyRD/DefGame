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
import { IWeapon } from "../IWeapon";

export class PersonWeapon extends Weapon<IPresonWeaponConfig, IPersonWeaponModel, IPersonWeaponAssets> implements IWeapon{
    private animation: PersonWeaponAnimation | undefined

    protected CreatePersonAnimation(owner: Player){
        return new PersonWeaponAnimation(
            owner,
            this.config.AnimationSet,
            this.DataObject.Assets,
            this.WeaponModel)
    }

    Reload() {
        if(RunService.IsClient())
            this.animation?.PlayReload()
    }

    constructor(model: IPersonWeaponModel, config: IPresonWeaponConfig, createFireModule: FireModuleFactory<IPersonWeaponModel, IPersonWeaponAssets>){
            super(model, config, createFireModule, new PersonWeaponAssetParser())
            this.OwnerState.ChangeOwnerEvent.Event.Connect((_, plr) => {
                if(plr) this.animation = this.CreatePersonAnimation(plr)
            })
    }
}