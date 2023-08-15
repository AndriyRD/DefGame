import { AmmoContainer } from "./Ammo/AmmoContainer";
import { IFireModule } from "./IFireModule";

export class WeaponState{
    protected owner: Player | undefined
    protected isFire = false

    protected CanEnableFireState(){
        return true
    }

    GetFireDelay(fireSpeed: number): number {
        return 1/fireSpeed
    }

    ChangeOwner(owner: Player){
        if(!this.owner)
            this.owner = owner
    }

    ChangeFireState(val: boolean){
        if(val === this.isFire) return
        if(val){
            if(this.CanEnableFireState())
                this.fireModule.SwithFireState(true)
        }
        else{
            this.fireModule.SwithFireState(false)
        }
        this.isFire = val
    }

    constructor(protected readonly fireModule: IFireModule,
        protected readonly ammo: AmmoContainer){
            this.ammo.Events.ChangeMagazine.Event.Connect((countOfAmmo: number) => {
                if(countOfAmmo < 1)
                    this.ChangeFireState(false)
            })

            this.fireModule.FireEvent.Event.Connect((countOfBuller = 1) => {
                if(this.ammo.GetState().Mag > 0)
                    this.ammo.GetMagazine().Take()
                this.ChangeFireState(false)
            })
    }
}