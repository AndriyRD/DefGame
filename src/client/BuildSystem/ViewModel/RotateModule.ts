import { BaseGameLoop } from "shared/BaseGameLoop"

export class RotateModule {
    private root: BasePart
    private readonly loopHandler = new BaseGameLoop().SetTickRate(1/20)
    private readonly ROATATION_ANGLE = {
        RIGHT: CFrame.Angles(0,math.rad(10),0),
        LEFT: CFrame.Angles(0,math.rad(-10),0)
    }

    private RotateTo(angle: CFrame){
        this.model.PivotTo(this.model.GetPivot().mul(angle))
    }

    private StartRotation(angle: CFrame){
        this.loopHandler.AddTask('main', () => this.RotateTo(angle)).StartAsync()
    }

    private SetRoot(model: Model){
        this.root = model.PrimaryPart as BasePart
        if (!this.root) error(`Not found PrimaryPart in model: ${model}`)
        return model
    }

    CancelIfRotateion(){
        this.loopHandler.Stop().ClearTaskList()
    }

    Rotation(toRight: boolean){
        this.CancelIfRotateion()

        if (toRight)
            this.StartRotation(this.ROATATION_ANGLE.RIGHT)
        else
            this.StartRotation(this.ROATATION_ANGLE.LEFT)
    }

    SetNewModel(model: Model){
        this.model = this.SetRoot(model)
    }

    constructor(private model: Model){
        this.root = model.PrimaryPart as BasePart
    }
}