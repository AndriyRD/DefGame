import { PlayerStorageContainer } from "server/Core/PlayerStorage/PlayerStorageContainer";
import { RemoteProvider } from "shared/RemoteProvider";
import { PlayerFireModules } from "shared/Weapon/PlayerFireModules";
import { ServerWeaponManager } from "./ServerWeaponManager";
import { Weapon } from "shared/Weapon/Weapon";
import { IWeaponConfig } from "shared/Weapon/WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "shared/Weapon/WeaponModel/IWeaponModel";
import { AutoFire } from "shared/Weapon/FireModule/AutoFire";
import { IWeaponAssets } from "shared/Weapon/Asset/IWeaponAssets";

export class WeaponController extends PlayerStorageContainer<string, Weapon<IWeaponConfig, IWeaponModel, IWeaponAssets>> {
    private readonly remote = RemoteProvider.GetForWeapon()
    private readonly serverWeaponManager = new ServerWeaponManager()
    private readonly playerFireModules = new PlayerFireModules()

    CreateWeapon(owner: Player, model: Model){
        const weapon = this.serverWeaponManager.RegisterWeapon(owner, model)
        const id = weapon.DataObject.Name

        this.AddItem(owner, id, weapon)
        this.playerFireModules.Add(
            owner, 
            id, 
            new AutoFire(weapon.fireModule))
        this.remote.CreateWeapon.FireAllClients(owner, id)
    }

    StartFire(plr: Player, id: string){
        this.playerFireModules.GetFireModule(plr, id).FireModule.StartFire()
        this.remote.StartFire.FireAllClients(plr, id)
    }

    StopFire(plr: Player, id: string){
        this.playerFireModules.GetFireModule(plr, id).FireModule.StopFire()
        this.remote.StopFire.FireAllClients(plr, id)
    }
}