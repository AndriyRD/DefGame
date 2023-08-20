import { FireModule } from "shared/Weapon/FireModule/FireModule";
import { IWeaponModel } from "shared/Weapon/WeaponModel/IWeaponModel";
import { BaseHitHandler } from "./ServerBaseHitHandler";

export class BaseFireHandler extends FireModule<IWeaponModel> {
    protected readonly hitHandler = new BaseHitHandler()

    Fire(){
        
    }
}