import { BaseGameLoop } from "shared/BaseGameLoop";
import { IWeapon } from "./IWeapon";
import { WeaponContainer } from "./WeaponContainer/WeaponContainer";

export class AutoFireModule {
    protected readonly weapon: IWeapon
    private readonly handleLoop: BaseGameLoop
    private work = false

    StartFire(){
        if (this.work) return
        this.handleLoop.StartAsync()
        this.work = true
    }

    StopFire(){
        if (!this.work) return
        this.handleLoop.Stop()
        this.work = false
    }

    constructor(private readonly weaponContainer: WeaponContainer){
        this.weapon = weaponContainer.GetWeapon()
        this.handleLoop = new BaseGameLoop().SetTickRate(this.weapon.GetFireDelay())
        this.handleLoop.AddTask('main', () => { 
            weaponContainer.Fire()
        })
    }
}