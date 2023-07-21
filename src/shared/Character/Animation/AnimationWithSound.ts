import { ReloadableAnimation } from "./ReloadableAnimation"

export class AnimationWithSound extends ReloadableAnimation {

    protected Laod(){
        super.Laod()
        this.track!.KeyframeReached.Connect((name) => {
            this.soundSet.get(name)?.Play()
        })
    }

    constructor(
        protected readonly owner: Player,
        protected readonly aniamtion: Animation,
        protected readonly soundSet: Map<string, Sound>){
            super(owner, aniamtion)
        }
}