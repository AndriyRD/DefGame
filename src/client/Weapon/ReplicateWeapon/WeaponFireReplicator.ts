import { RemoteProvider } from "shared/RemoteProvider";
import GetCharacter from "shared/Character/GetCharacter";
import { Players } from "@rbxts/services";
import { WeaponProvider } from "../WeaponProvider";
import { IAutoFiredWeapon } from "shared/Weapon/IAutoFiredWeapon";

export class WeaponReplicator { 
    private IsLocalPlayer = (plr: Player) => Players.LocalPlayer === plr

    private OnCreateWeapon(plr: Player, id: string){
        if (this.IsLocalPlayer(plr)) return;
        const model = GetCharacter(plr).WaitForChild(id) as Model
        WeaponProvider.RegisterWeapon(model)
    }

    private OnStartFire(plr: Player, weaponGlobalID: number){
        if (this.IsLocalPlayer(plr)) return;
        WeaponProvider.Find<IAutoFiredWeapon>(weaponGlobalID).StartFire()
    }

    private OnStopFire(plr: Player, weaponGlobalID: number){
        if (this.IsLocalPlayer(plr)) return;
        WeaponProvider.Find<IAutoFiredWeapon>(weaponGlobalID).StopFire()
    }

    Run(){
        const events = RemoteProvider.GetForWeapon()
        events.CreateWeapon.OnClientEvent.Connect((p,m) => this.OnCreateWeapon(p, m))
        events.StartFire.OnClientEvent.Connect((p,n) => this.OnStartFire(p, n))
        events.StopFire.OnClientEvent.Connect((p,n) => this.OnStopFire(p, n))
    }
}