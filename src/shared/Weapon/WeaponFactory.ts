import WEAPON_CONFIG_LIST from "shared/Weapon/WEAPON_CONFIG_LIST";
import { BaseWeapon } from "./BaseWeapon";
import { WeaponModelParser } from "./WeaponModelParser";
import { AmmoContainer } from "./Ammo/AmmoContainer";
import { IWeaponConfig } from "./IWeaponConfig";

export class WeaponFactory {
    private readonly modelParser = new WeaponModelParser
    private GetConfig(name: string){
        const config = WEAPON_CONFIG_LIST.get(name) as IWeaponConfig
        if (!config) error(`Not found config for weapon: ${name}`)
        return config
    }

    Create(owner: Player, name: string){
        const config = this.GetConfig(name)

        return new BaseWeapon(
            owner,
            name,
            this.modelParser.ByOriginal(name),
            config,
            new AmmoContainer(config.AmmoConfig))
    }

    CreateByModel(owner: Player, model: Model){
        const name = model.Name
        const config = this.GetConfig(name)

        return new BaseWeapon(
            owner,
            name,
            this.modelParser.Parse(model),
            config,
            new AmmoContainer(config.AmmoConfig))
    }
}