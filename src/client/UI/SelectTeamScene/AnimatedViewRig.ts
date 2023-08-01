import { TweenService } from "@rbxts/services"

export class AnimatedViewRig {
    private readonly originPartPositions = new Map<BasePart, Vector3>

    private GetRigTweenPosition(part: BasePart, offset: Vector3){
        return this.originPartPositions.get(part)!.add(offset)
    }

    private TweenPosition(offset: Vector3){
        for (const part of this.rig.GetDescendants()) {
            if(part.IsA("BasePart"))
                TweenService.Create(
                    part, 
                    this.tweenInfo, 
                    {Position: this.GetRigTweenPosition(part, offset)}).Play()
        }
    }

    TweenToOffset(offset: Vector3){
        this.TweenPosition(offset)
    }

    ResetPosition(){
        for (const part of this.rig.GetDescendants()) {
            if(part.IsA("BasePart"))
                TweenService.Create(
                    part, 
                    this.tweenInfo, 
                    {Position: this.originPartPositions.get(part)!}).Play()
        }
    }

    ParsePositions(){
        for (const item of this.rig.GetDescendants())
            if(item.IsA('BasePart'))
                this.originPartPositions.set(item, item.Position)
    }

    constructor(private readonly rig: Model, private tweenInfo: TweenInfo){
        this.ParsePositions()
    }
}