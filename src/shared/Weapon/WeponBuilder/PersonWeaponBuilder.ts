import { PersonWeaponModelParser } from "../ModelParsers/PersonWeaponModelParser";
import { IPresonWeaponConfig } from "../WeaponConfigurations/IPresonWeaponConfig";
import { IPersonWeaponModel } from "../WeaponModel/IPersonWeaponModel";
import { PersonWeapon } from "../Weapons/PersonWeapon";
import { WeaponBuilder } from "./WeaponBuilder";

export class PersonWeaponBuilder extends WeaponBuilder<PersonWeapon> {
    protected modelParser = new PersonWeaponModelParser()

    protected CreateWeapon(model: IPersonWeaponModel, config: IPresonWeaponConfig) {
        return new PersonWeapon(model, config, this.createFireModule!)
    }
}