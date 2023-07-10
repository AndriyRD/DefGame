import { RemoteProvider } from "shared/RemoteProvider"
import { HitPackage } from "./HitPackage"
import { HitTarget } from "./HitTarget"

export class HitBuffer {
    private readonly hitPackage = new HitPackage(undefined, undefined) 
    private readonly hitEvent = RemoteProvider.GetForWeapon().Hit 

    private Send(){
        this.hitEvent.FireServer(this.hitPackage.GetResults())
        this.hitPackage.Reset()
    }

    Buffer(inst: BasePart, damage: number){
        if(HitTarget.TakeDamage(inst, damage) > 0)
            this.hitPackage.Push({Instance: inst, Damage: damage})
        else this.Send()
    }

    constructor(){
        this.hitPackage.OnReady.Event.Connect(() => this.Send())
    }
}