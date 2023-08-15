import { RunService } from "@rbxts/services";
import { AmmoContainer } from "./Ammo/AmmoContainer";
import { BaseWeapon } from "./BaseWeapon";
import { IWeapon } from "./IWeapon";
import { IWeaponModel } from "./WeaponModel/IWeaponModel";
import { PersonWeaponAnimation } from "./Animation/PersonWeaponAnimation";
import { IPresonWeaponConfig } from "./IPresonWeaponConfig";

export class PersonWeapon extends BaseWeapon<IPresonWeaponConfig> {
    private readonly animation: PersonWeaponAnimation

    Relaod(): IWeapon {
        if(RunService.IsClient())
            this.animation.PlayReload()
        return super.Relaod()
    }

    constructor(owner: Player, name: string, model: IWeaponModel, config: IPresonWeaponConfig,
        ammo: AmmoContainer){
            super(owner, name, model, config, ammo)
            this.animation = new PersonWeaponAnimation(this)
    }
}