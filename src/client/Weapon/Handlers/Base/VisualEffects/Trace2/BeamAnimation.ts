import { TweenService } from "@rbxts/services"
import { TraceBeamTransparencyAnimation } from "../Trace/TraceBeamTransparencyAnimation"

export class BeamAnimation {
    private readonly curveSizeRange = new NumberRange(0, 10)
    private readonly random = new Random(tick())
    private readonly beamTransparencyAnimation = new TraceBeamTransparencyAnimation(undefined, undefined)
    private tweenInfo: TweenInfo = new TweenInfo()

    private GetMinCurveSize(){
        return this.random.NextNumber(-this.curveSizeRange.Max, -this.curveSizeRange.Min)
    }

    private GetMaxCurveSize(){
        return this.random.NextNumber(this.curveSizeRange.Min, this.curveSizeRange.Max)
    }

    private GetRandomCurveSizeValue(){
        return this.random.NextNumber(this.GetMinCurveSize(), this.GetMaxCurveSize())
    }

    SetTweenInfo(info: TweenInfo){
        this.tweenInfo = info
        this.beamTransparencyAnimation.SetTweenInfo(info)
        return this
    }

    Play(beam: Beam){
        const tween = TweenService.Create(beam, this.tweenInfo, {
            CurveSize0: this.GetRandomCurveSizeValue(),
            CurveSize1: this.GetRandomCurveSizeValue(),
        })
        tween.Play()
        this.beamTransparencyAnimation.Animate(beam, undefined)
        return tween
    }
}