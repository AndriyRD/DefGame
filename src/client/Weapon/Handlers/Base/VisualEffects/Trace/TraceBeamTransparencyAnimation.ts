import { TweenService } from "@rbxts/services"

export class TraceBeamTransparencyAnimation {
    private initValue: number
    private tweenInfo: TweenInfo

    private NewBufferValue(startVal: number){
        const nv = new Instance('NumberValue')
        nv.Value = startVal
        return nv
    }

    SetTweenInfo(info: TweenInfo){
        this.tweenInfo = info
    }

    Animate(beam: Beam, onCompleted: (() => void) | undefined){
        const bufferNumValue = this.NewBufferValue(this.initValue)
        let numChangeConnection = bufferNumValue
            .GetPropertyChangedSignal('Value')
            .Connect(()=>
                beam.Transparency = new NumberSequence(bufferNumValue.Value))

        const tween = TweenService.Create(bufferNumValue, this.tweenInfo, {Value: 1})

        let tweenConnaction = tween.Completed.Connect(() => {
            numChangeConnection.Disconnect()
            numChangeConnection = undefined as any

            tweenConnaction.Disconnect()
            tweenConnaction = undefined as any
            if(onCompleted) onCompleted()
            beam.Destroy()
            bufferNumValue.Destroy()
        })

        tween.Play()
        return tween
    }

    constructor(info: TweenInfo | undefined, initValue: number | undefined){
        this.tweenInfo = info ? info : new TweenInfo()
        this.initValue = initValue ? initValue : .1
    }
}