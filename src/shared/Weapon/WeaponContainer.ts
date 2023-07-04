import { AutoFireModule } from "./AutoFireModule";
import { IWeapon } from "./IWeapon";
import { IFireHandler } from "./WeaponHandler/IFireHandler";
import { IHitHandler } from "./WeaponHandler/IHitHandler";

export class WeaponContainer {
    private readonly owner

    Fire(){
        this.fireHandler.Fire()
        this.weapon.GetAmmoContainer().GetMagazine().Take()
    }

    GetOwner(){
        return this.owner
    }

    GetWeapon(){
        return this.weapon
    }

    GetFireHandler(){
        return this.fireHandler
    }

    GetHitHandler(){
        return this.hitHandler
    }

    Destory(){
        //TODO: clear from memory
    }

    constructor(
        private readonly weapon: IWeapon,
        private readonly fireHandler: IFireHandler,
        private readonly hitHandler: IHitHandler){
            this.owner = weapon.GetOwner()
        }
}