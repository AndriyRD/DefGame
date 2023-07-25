import { ReloadableCharacter } from "../ReloadableCharacter"
import { ReloadableAnimation } from "./ReloadableAnimation"

export class AnimationWithSound extends ReloadableAnimation {

    protected Laod(){
        super.Laod()
        this.track!.KeyframeReached.Connect((name) => {
            this.soundSet.get(name)?.Play()
        })
    }

    constructor(
        owner: Player| ReloadableCharacter,
        protected readonly aniamtion: Animation,
        protected readonly soundSet: Map<string, Sound>){
            super(owner, aniamtion)
        }
}