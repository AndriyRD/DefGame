import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { BaseWeapon } from "../Weapons/BaseWeapon";
import { WeaponModelParser } from "../ModelParsers/WeaponModelParser";
import { WeaponBuilder } from "./WeaponBuilder";

export class BaseWeaponBuilder extends WeaponBuilder<BaseWeapon>{
    protected modelParser = new WeaponModelParser()

    protected CreateWeapon(model: IWeaponModel, config: IWeaponConfig){
        return new BaseWeapon(model, config, this.createFireModule!)
    }
}