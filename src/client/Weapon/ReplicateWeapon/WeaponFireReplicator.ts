import { AutoFireModule } from "shared/Weapon/AutoFireModule";
import { WeaponProvider } from "../WeaponProvider";
import { PlayerFireModules } from "../../../shared/Weapon/PlayerFireModules";
import { RemoteProvider } from "shared/RemoteProvider";
import GetCharacter from "shared/Character/GetCharacter";
import { Players } from "@rbxts/services";

export class WeaponReplicator {
    private readonly list = new PlayerFireModules()
    
    private IsLocalPlayer(plr: Player) {return Players.LocalPlayer === plr}

    private OnCreateWeapon(plr: Player, id: string){
        if (this.IsLocalPlayer(plr)) return
        const model = GetCharacter(plr).WaitForChild(id) as Model
        const weaponContainer = WeaponProvider.weaponManager.RegisterWeapon(plr, model)
        const fireModule = new AutoFireModule(weaponContainer)
        this.list.Add(plr, model.Name, fireModule)
    }

    private OnStartFire(plr: Player, weaponID: string){
        if (this.IsLocalPlayer(plr)) return
        this.list.GetFireModule(plr, weaponID).FireModule.StartFire()
    }

    private OnStopFire(plr: Player, weaponID: string){
        if (this.IsLocalPlayer(plr)) return
        this.list.GetFireModule(plr, weaponID).FireModule.StopFire()
    }

    Run(){
        const events = RemoteProvider.GetForWeapon()
        events.CreateWeapon.OnClientEvent.Connect((p,m) => this.OnCreateWeapon(p, m))
        events.StartFire.OnClientEvent.Connect((p,n) => this.OnStartFire(p, n))
        events.StopFire.OnClientEvent.Connect((p,n) => this.OnStopFire(p, n))
    }
}