import { BaseGameLoop } from "shared/Loop/BaseGameLoop";
import { FireModule } from "./FireModule";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { IWeaponAssets } from "../Asset/IWeaponAssets";

export class AutoFire {
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

    constructor(private readonly fireModule: FireModule<IWeaponModel, IWeaponAssets>){
        this.handleLoop = new BaseGameLoop()
            .SetTickRate(this.fireModule.weaponData.FireDelay)

        this.handleLoop.AddTask('main', () => { 
            fireModule.Fire()
        })
    }
}