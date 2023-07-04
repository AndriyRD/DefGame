import { PlayerStorageContainer } from "server/Core/PlayerStorage/PlayerStorageContainer";
import { ServerWeaponManager } from "./ServerWeaponManager";
import { WeaponContainer } from "shared/Weapon/WeaponContainer";
import { RemoteProvider } from "shared/RemoteProvider";
import { PlayerFireModules } from "shared/Weapon/PlayerFireModules";
import { AutoFireModule } from "shared/Weapon/AutoFireModule";

export class WeaponController extends PlayerStorageContainer<string, WeaponContainer> {
    private readonly remote = RemoteProvider.GetForWeapon()
    private readonly serverWeaponManager = new ServerWeaponManager()
    private readonly playerFireModules = new PlayerFireModules()

    CreateWeapon(owner: Player, model: Model){
        const weaponContainer = this.serverWeaponManager.RegisterWeapon(owner, model)
        const weapon = weaponContainer.GetWeapon()
        const id = weapon.GetName()

        this.AddItem(owner, id, weaponContainer)
        this.playerFireModules.Add(
            owner, 
            id, 
            new AutoFireModule(weaponContainer))
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