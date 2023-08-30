import { RemoteProvider } from "shared/RemoteProvider";
import { PlayerFireModules } from "shared/Weapon/PlayerFireModules";
import { ServerWeaponManager } from "./ServerWeaponManager";
import { AutoFire } from "shared/Weapon/FireModule/AutoFire";

export class WeaponController {
    private readonly remote = RemoteProvider.GetForWeapon()
    private readonly weaponManager = new ServerWeaponManager()
    private readonly playerFireModules = new PlayerFireModules()

    CreateWeapon(owner: Player, model: Model){
        const weapon = this.weaponManager.RegisterWeapon(model)
        const id = weapon.DataObject.Name

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

    Get(owner: Player, id: string){
        return this.weaponManager.GetById(owner, id)
    }

    DropWeapon(owner: Player, id: string){
        const weapon = this.weaponManager.GetById(owner, id)
        if(weapon) weapon.OwnerState.RemoveOwner()
        else error(`Not found weapon: ${id} for player: ${owner}`)
    }

    SetNewWeaponOwner(newOwner: Player, weaponModel: Model){
        const weapon = this.weaponManager.GetByModel(weaponModel)
        if(weapon) weapon.OwnerState.ChagneOwner(newOwner)
        else error(`Not found registered weapon by model: ${weaponModel.GetFullName()}`)
    }
}