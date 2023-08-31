import { ClientWeaponManager } from "./ClientWeaponManager";
import { IWeapon } from "shared/Weapon/IWeapon";

export class WeaponProvider {
    private static manager = new ClientWeaponManager()

    static RegisterWeapon<T extends IWeapon>(model: Model){
        return WeaponProvider.manager.RegisterWeapon(model) as any as T 
    }

    static Find<T extends IWeapon>(globalID: number){
        return this.manager.FindByGlobalId(globalID) as T
    }
}