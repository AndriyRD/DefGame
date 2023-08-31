import { RemoteProvider } from "shared/RemoteProvider";
import { ServerWeaponManager } from "./ServerWeaponManager";
import { IAutoFiredWeapon } from "shared/Weapon/IAutoFiredWeapon";

export class WeaponController {
    private readonly remote = RemoteProvider.GetForWeapon()
    private readonly weaponManager = new ServerWeaponManager()

    CreateWeapon(model: Model){
        return this.weaponManager.RegisterWeapon(model)
    }

    StartFire(plr: Player, globalId: number){
        print(`Start fire event: ${globalId}`)
        this.weaponManager.FindByGlobalId<IAutoFiredWeapon>(globalId).StartFire()
        this.remote.StartFire.FireAllClients(plr, globalId)
    }

    StopFire(plr: Player, globalId: number){
        this.weaponManager.FindByGlobalId<IAutoFiredWeapon>(globalId).StopFire()
        this.remote.StopFire.FireAllClients(plr, globalId)
    }

    Get(globalId: number){
        print(`Get event: ${globalId}`)
        return this.weaponManager.FindByGlobalId(globalId)
    }

    DropWeapon(globalId: number){
        print(`Drop event: ${globalId}`)
        const weapon = this.Get(globalId)
        if(weapon) weapon.OwnerState.RemoveOwner()
        else error(`Not found weapon by global-id: ${globalId}`)
    }

    SetNewWeaponOwner(newOwner: Player, globalId: number){
        const weapon = this.weaponManager.FindByGlobalId(globalId)
        if(weapon) weapon.OwnerState.ChagneOwner(newOwner)
        else error(`Not found registered weapon by global-id ${globalId}`)
    }
}