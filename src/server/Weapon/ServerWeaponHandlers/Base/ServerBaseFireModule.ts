import { IWeaponAssets } from "shared/Weapon/Asset/IWeaponAssets";
import { FireModule } from "shared/Weapon/FireModule/FireModule";
import { IWeaponModel } from "shared/Weapon/WeaponModel/IWeaponModel";
import { BaseHitHandler } from "./ServerBaseHitHandler";

export class ServerBaseFireModule extends FireModule<IWeaponModel, IWeaponAssets> {
    protected hitHandler = new BaseHitHandler
    
    Fire(): void {
    }

    Dispose(): void {
    }

}