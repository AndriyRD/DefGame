import { Players } from "@rbxts/services"
import { FireBulletTrace } from "./FireBulletTrace"
import { SmokeBulletTrace } from "./SmokeBulletTrace"

export class BulletTrace {
    private readonly mouse
    private readonly smokeBulletTrace
    private readonly fireBulletTrace = new FireBulletTrace()

    Fire(pos: Vector3){
        this.fireBulletTrace.Spawn(this.muzzlePart.Position, pos)
        this.smokeBulletTrace.Spawn(pos)
    }

    constructor(private readonly muzzlePart: BasePart){
        this.smokeBulletTrace = new SmokeBulletTrace(muzzlePart)
        this.mouse = Players.LocalPlayer.GetMouse()
    }
}