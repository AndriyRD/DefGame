import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { ICharatcerAnimationIDSet } from "../ICharatcerAnimationIDSet";
import GetHumanoidSpeed from "shared/Character/GetHumanoidSpeed";
import { RunTempAnimation } from "./RunTempAnimation";
import { AnimationConfig } from "../AnimationConfig";
import { IdleTempAnimation } from "./IdleTempAnimation";
import { ITempAnimation } from "./ITempAnimation";

export class TempAnimationController {
    private currentTempAnim: ITempAnimation | undefined

    private CraeteAnimationFromID(id: string){
        const anim = new Instance("Animation")
        anim.AnimationId = AnimationConfig.ANIMATION_ASSET_ID_PREFIX+id
        return anim
    }

    Play(){
        const hum = this.reloadableCharacter.GetHumanoid()
        const animator = this.reloadableCharacter.GetAnimator()
        if (this.currentTempAnim) this.currentTempAnim.Break()

        if (GetHumanoidSpeed(hum) >= AnimationConfig.MIN_SPEED_FOR_RUN_ANIMATION)
            { 
                this.currentTempAnim = new RunTempAnimation(animator, hum, 
                {
                    Run: this.CraeteAnimationFromID(this.animationIDSet.Run!), 
                    Walk: this.CraeteAnimationFromID(this.animationIDSet.Walk!)
                }).ContinueTrack()
            }
        else 
            {
                this.currentTempAnim = new IdleTempAnimation(animator, hum, 
                    this.CraeteAnimationFromID(this.animationIDSet.Idle!)).ContinueTrack()
            }
    }

    ChangeAnimationIDSet(newIDSet: ICharatcerAnimationIDSet){
        this.animationIDSet = newIDSet 
    }

    constructor(
        private readonly reloadableCharacter: ReloadableCharacter,
        protected animationIDSet: ICharatcerAnimationIDSet
        ){}
}