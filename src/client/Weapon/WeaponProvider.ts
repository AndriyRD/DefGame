import { ClientWeaponManager } from "./ClientWeaponManager";
import { IWeapon } from "shared/Weapon/IWeapon";

export class WeaponProvider {
    private static manager = new ClientWeaponManager()

    static RegisterWeapon<T extends IWeapon>(plr: Player, model: Model){
        return WeaponProvider.manager.RegisterWeapon(plr, model) as any as T 
    }
}