import { WeaponController } from "../WeaponController";

export class WeaponServiceAPI {
    private static readonly controller = new WeaponController()

    static Create(model: Model){
        this.controller.CreateWeapon(model)
    }

    static Get(globalID: number){
        return this.controller.Get(globalID)
    }

    static StartFire(plr: Player, globalID: number){
        this.controller.StartFire(plr, globalID)
    }

    static StopFire(plr: Player, globalID: number){
        this.controller.StopFire(plr, globalID)
    }

    static DropWeapon(globalID: number){
        this.controller.DropWeapon(globalID)
    }

    static SetNewOwner(owner: Player, globalId: number){
        this.controller.SetNewWeaponOwner(owner, globalId)
    }
}