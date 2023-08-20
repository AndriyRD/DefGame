import { IEventListener } from "server/Core/EventSystem/IEventListener"
import { WeaponServiceAPI } from "./WeaponServiceAPI"
import { IHitResult } from "shared/Weapon/FireModule/IHitResult"

export class WeaponEventListener implements IEventListener{

    GetId(): string {
        return 'Weapon'
    }

    OnStartFire = (plr: Player, name: string) => {
        WeaponServiceAPI.StartFire(plr, name)
    }

    OnStopFire = (plr: Player, name: string) => {
        WeaponServiceAPI.StopFire(plr, name)
    }

    OnCreateWeapon = (plr: Player, model: Model) => {
        WeaponServiceAPI.Create(plr, model)
    }

    OnHitPackage = (plr: Player, results: Array<IHitResult>) => {
        print('Hited results: ' + tostring(results.size()))
        for (const res of results) {
            print(res.Instance)
        }
    }
}