import StopTracks from "../StopTracks";
import { ITempAnimation } from "./ITempAnimation";

export abstract class BaseTempAniamtino implements ITempAnimation {
    protected readonly track: AnimationTrack
    protected runnedTrack = false
    abstract CanBreak(): boolean
    
    Break(): void {
        this.track.Stop(0)
        this.track.Destroy()
        this.runnedTrack = false
    }

    ContinueTrack() {
        if (this.runnedTrack) return this
        StopTracks(this.animator)
        this.track.Play()
        this.runnedTrack = true
        return this
    }

    constructor(
        protected readonly animator: Animator,
        protected readonly hum: Humanoid,
        protected readonly anim: Animation
    ){
            this.track = this.animator.LoadAnimation(anim)
    }
}