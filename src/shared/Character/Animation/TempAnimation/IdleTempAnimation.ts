import GetHumanoidSpeed from "shared/Character/GetHumanoidSpeed";
import { BaseTempAniamtino } from "./BaseTempAniamtino";

export class IdleTempAnimation extends BaseTempAniamtino {
    CanBreak(): boolean {
        if (GetHumanoidSpeed(this.hum) > 0.3) return true
        return false
    }

    ContinueTrack() {
        super.ContinueTrack()

        const moveConn = this.hum.GetPropertyChangedSignal("MoveDirection").Connect(()=>{
            if (this.CanBreak()){
                this.Break()
                moveConn.Disconnect()
            }
        })

        const animChangeConn = this.animator.AnimationPlayed.Connect(()=>{
            this.Break()
            animChangeConn.Disconnect()
        })

        return this
    }
}