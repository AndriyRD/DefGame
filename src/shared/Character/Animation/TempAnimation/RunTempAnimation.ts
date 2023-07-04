import { AnimationConfig } from "../AnimationConfig";
import { CHARACTER_ANIMATIONS_NAMES } from "../CHARACTER_ANIMATIONS_NAMES";
import StopTracks from "../StopTracks";
import { ITempAnimation } from "./ITempAnimation";

type RunSet<T> = {
    Run: T
    Walk: T
}

export class RunTempAnimation implements ITempAnimation {
    private readonly trackSet: RunSet<AnimationTrack>

    CanBreak() {
        if ((this.hum.MoveDirection.Magnitude) < AnimationConfig.MIN_SPEED_FOR_RUN_ANIMATION)
        return true
        else return false
    }

    TrackSetToList(){
        const list = new Map<string, AnimationTrack>()
        list.set(CHARACTER_ANIMATIONS_NAMES.RUN, this.trackSet.Run)
        list.set(CHARACTER_ANIMATIONS_NAMES.WALK, this.trackSet.Walk)
        return list
    }

    Break(){
        for (const e of this.TrackSetToList()) {
            e[1].Stop(0)
            e[1].Destroy()
        }
    }

    ContinueTrack() {
        StopTracks(this.animator)
        
        for (const e of this.TrackSetToList()) 
            e[1].Play()
        
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

    constructor(
        private readonly animator: Animator,
        private readonly hum: Humanoid,
        animSet: RunSet<Animation>){
            this.trackSet = {
                Run: animator.LoadAnimation(animSet.Run),
                Walk: animator.LoadAnimation(animSet.Walk)
            }
    }
}