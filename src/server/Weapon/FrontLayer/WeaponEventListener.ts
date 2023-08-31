import { IEventListener } from "server/Core/EventSystem/IEventListener"
import { WeaponServiceAPI } from "./WeaponServiceAPI"
import { IHitResult } from "shared/Weapon/FireModule/IHitResult"

export class WeaponEventListener implements IEventListener{

    GetId(): string {
        return 'Weapon'
    }

    OnStartFire = (plr: Player, globalID: number) => {
        WeaponServiceAPI.StartFire(plr, globalID)
    }

    OnStopFire = (plr: Player, globalID: number) => {
        WeaponServiceAPI.StopFire(plr, globalID)
    }

    OnCreateWeapon = (plr: Player, model: Model) => {
        WeaponServiceAPI.Create(model)
    }

    OnHitPackage = (plr: Player, results: Array<IHitResult>) => {
        print('Hited results: ' + tostring(results.size()))
        for (const res of results) {
            print(res.Instance)
        }
    }

    OnNewWeaponOwner = (plr: Player, char: Model, globalId: number) => {
        WeaponServiceAPI.SetNewOwner(plr, globalId)
    }

    OnDropWeapon = (plr: Player, globalID: number) => {
        WeaponServiceAPI.DropWeapon(globalID)
    }
}