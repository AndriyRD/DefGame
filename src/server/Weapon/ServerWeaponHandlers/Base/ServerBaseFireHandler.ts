import { FireModule } from "shared/Weapon/FireModule/FireModule";
import { IWeaponModel } from "shared/Weapon/WeaponModel/IWeaponModel";
import { BaseHitHandler } from "./ServerBaseHitHandler";
import { IWeaponAssets } from "shared/Weapon/Asset/IWeaponAssets";

export class BaseFireHandler extends FireModule<IWeaponModel, IWeaponAssets> {
    protected readonly hitHandler = new BaseHitHandler()

    Fire(){
        
    }
}