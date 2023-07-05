import { TextService, TweenService } from "@rbxts/services"

export class RotateModule {
    private readonly fullRotationTime = 1
    private readonly root: BasePart
    private tweenInfo = new TweenInfo(this.fullRotationTime)
    private currentTween: Tween | undefined = undefined
    private readonly ROATATION_ANGLE = {
        RIGHT: CFrame.Angles(math.pi*2,0,0),
        LEFT: CFrame.Angles(-math.pi*2,0,0)
    }

    private RotateTo(angle: CFrame){
        return TweenService.Create(
            this.root, 
            this.tweenInfo, 
            {CFrame: angle})
    }

    Rotateion(toRight: boolean){
        if (this.currentTween)
            this.currentTween.Cancel

        if (toRight)
            this.currentTween = this.RotateTo(this.ROATATION_ANGLE.RIGHT)
        else
            this.currentTween = this.RotateTo(this.ROATATION_ANGLE.LEFT)
            
        this.currentTween.Play()
    }

    constructor(private readonly model: Model){
        this.root = model.PrimaryPart as BasePart
    }
}