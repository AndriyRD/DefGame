import { RunService } from "@rbxts/services";
import { PersonWeaponAnimation } from "../Animation/PersonWeaponAnimation";
import { IPresonWeaponConfig } from "../WeaponConfigurations/IPresonWeaponConfig";
import { IPersonWeaponModel } from "../WeaponModel/IPersonWeaponModel";
import { IPersonWeaponAssets } from "../Asset/IPersonWeaponAssets";
import { PersonWeaponAssetParser } from "../Asset/PersonWeaponAssetParser";
import { FireModuleFactory } from "../WeponBuilder/FireModuleFactoryType";
import { Weapon } from "./Weapon";
import { IWeapon } from "../IWeapon";
import { IReloadebleWeapon } from "../IReloadebleWeapon";
import { IAutoFiredWeapon } from "../IAutoFiredWeapon";
import { AutoFire } from "../FireModule/AutoFire";

export class PersonWeapon extends Weapon<IPresonWeaponConfig, IPersonWeaponModel, IPersonWeaponAssets> implements IWeapon, IReloadebleWeapon, IAutoFiredWeapon{
    private animation: PersonWeaponAnimation | undefined
    private readonly autoFire: AutoFire

    protected CreatePersonAnimation(owner: Player){
        return new PersonWeaponAnimation(
            owner,
            this.config.AnimationSet,
            this.DataObject.Assets,
            this.WeaponModel)
    }

    StartFire(): IAutoFiredWeapon {
        this.autoFire.StartFire()
        return this
    }

    StopFire(): IAutoFiredWeapon {
        this.autoFire.StopFire()
        return this
    }

    Reload() {
        if(RunService.IsClient())
            this.animation?.PlayReload()
        this.DataObject.Ammo.Reload()
    }

    constructor(model: IPersonWeaponModel, config: IPresonWeaponConfig, createFireModule: FireModuleFactory<IPersonWeaponModel, IPersonWeaponAssets>){
            super(model, config, createFireModule, new PersonWeaponAssetParser())
            this.OwnerState.ChangeOwnerEvent.Event.Connect((_, plr) => {
                if(plr) this.animation = this.CreatePersonAnimation(plr)
            })
        this.autoFire = new AutoFire(this.fireModule)
    }
}