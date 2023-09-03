import { RunService } from "@rbxts/services";
import BODY_PART_NAMES from "shared/BODY_PART_NAMES";
import { IDisposable } from "shared/ObjectPool/IDisposable";

export class RotatedUpperTorso implements IDisposable {
    private readonly waist: Motor6D
    private readonly lowerTorso: BasePart
    private readonly upperTorso: BasePart
    private readonly DEFAULT_OFFSET: CFrame
    private connection: RBXScriptConnection | undefined

    private OnUpdate(){
        const defaultOffset = this.DEFAULT_OFFSET
        const worldDefaultOffset = this.lowerTorso.CFrame.ToWorldSpace(defaultOffset)
        const lookToMouseCF = CFrame.lookAt(worldDefaultOffset.Position, this.mouse.Hit.Position)

        this.waist.C0 = CFrame.fromMatrix(defaultOffset.Position, 
            defaultOffset.XVector,
            lookToMouseCF.YVector,
            defaultOffset.ZVector)
    }

    Enable(){
        if(this.connection?.Connected) this.connection.Disconnect()
        this.connection = RunService.Heartbeat.Connect(() => this.OnUpdate())
        return this
    }

    Disable(){
        if(this.connection) this.connection.Disconnect()
        return this
    }

    Dispose(): void {
        warn(`implamentation dispose`)
    }

    constructor(private readonly charatcer: Model, private readonly mouse: PlayerMouse){
        this.upperTorso = charatcer.WaitForChild(BODY_PART_NAMES.R15.UPPER_TORSO) as BasePart
        this.lowerTorso = charatcer.WaitForChild(BODY_PART_NAMES.R15.LOWER_TORSO) as BasePart
        this.waist = this.upperTorso.WaitForChild(BODY_PART_NAMES.MOTORS_R15.WAIST) as Motor6D
        this.DEFAULT_OFFSET = this.waist.C0
    }
}