import { Weapon } from "shared/Weapon/Weapon";
import { ClientWeaponManager } from "./ClientWeaponManager";
import { IWeaponConfig } from "shared/Weapon/WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "shared/Weapon/WeaponModel/IWeaponModel";
import { IWeaponAssets } from "shared/Weapon/Asset/IWeaponAssets";

export class WeaponProvider {
    private static manager = new ClientWeaponManager()

    static RegisterWeapon<T extends Weapon<IWeaponConfig & any, IWeaponModel & any, IWeaponAssets & any>>(plr: Player, model: Model): T{
        return WeaponProvider.manager.RegisterWeapon(plr, model) as T
    }
}