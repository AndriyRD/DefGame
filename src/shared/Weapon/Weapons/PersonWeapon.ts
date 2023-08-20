import { RunService } from "@rbxts/services";
import { BaseWeapon } from "./BaseWeapon";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { PersonWeaponAnimation } from "../Animation/PersonWeaponAnimation";
import { IPresonWeaponConfig } from "../WeaponConfigurations/IPresonWeaponConfig";
import { IPersonWeaponModel } from "../WeaponModel/IPersonWeaponModel";
import { FireModule } from "../FireModule/FireModule";

export class PersonWeapon extends BaseWeapon<IPresonWeaponConfig, IPersonWeaponModel>{
    private readonly animation: PersonWeaponAnimation

    Reload() {
        if(RunService.IsClient())
            this.animation.PlayReload()
        return super.Reload()
    }

    constructor(model: IPersonWeaponModel, config: IPresonWeaponConfig, fireModule: FireModule<IPersonWeaponModel>){
            super(model, config, fireModule)
            this.animation = new PersonWeaponAnimation(this)
    }
}