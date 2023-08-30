import { WeaponController } from "../WeaponController";

export class WeaponServiceAPI {
    private static readonly controller = new WeaponController()

    static Create(plr: Player, model: Model){
        this.controller.CreateWeapon(plr, model)
    }

    static Get(plr: Player, id: string){
        return this.controller.Get(plr, id)
    }

    static StartFire(plr: Player, id: string){
        this.controller.StartFire(plr, id)
    }

    static StopFire(plr: Player, id: string){
        this.controller.StopFire(plr, id)
    }

    static DropWeapon(owner: Player, id: string){
        this.controller.DropWeapon(owner, id)
    }

    static SetNewOwner(owner: Player, model: Model){
        this.controller.SetNewWeaponOwner(owner, model)
    }
}