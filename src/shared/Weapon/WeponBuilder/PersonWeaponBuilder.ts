import { PersonWeaponModelParser } from "../ModelParsers/PersonWeaponModelParser";
import { WeaponModelParser } from "../ModelParsers/WeaponModelParser";
import { IWeaponBuildData } from "./IWeaponBuildData";
import { WeaponBuilder } from "./WeaponBuilder";

export class PersonWeaponBuilder extends WeaponBuilder {
    protected modelParser: WeaponModelParser = new PersonWeaponModelParser()
}