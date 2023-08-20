import { ClientWeaponManager } from "./ClientWeaponManager";

export class WeaponProvider {
    static manager = new ClientWeaponManager()

    static RegisterWeapon(plr: Player, model: Model){
        return WeaponProvider.manager.RegisterWeapon(plr, model)
    }
}