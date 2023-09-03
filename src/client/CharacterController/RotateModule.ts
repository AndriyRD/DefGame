import { RunService } from "@rbxts/services"
import { CHARACTER_LOAD_EVENT_NAMES, ReloadableCharacter } from "shared/Character/ReloadableCharacter"
import { GlobalConfig } from "shared/GlobalConfig"
import { IStateSwithable } from "shared/IStateSwithable"

export class RotateModule implements IStateSwithable {
    private connection: RBXScriptConnection | undefined = undefined
    private readonly mouse
    private readonly alignInstance = GlobalConfig.CHARACTER_ALIGHT_ISNTANCE.Clone()

    GetTargetPoint(target: BasePart){
        const pos = this.mouse.Hit.Position
        const lookVector = CFrame.lookAt(target.Position, pos)
        return CFrame.fromMatrix(target.Position, lookVector.XVector, target.CFrame.YVector, lookVector.ZVector)
    }

    Enable(){
        const root = this.character.GetRoot()
        const rootAttachment = this.character.GetRoot()
            .WaitForChild("RootAttachment") as Attachment
        this.alignInstance.Attachment0 = rootAttachment

        this.character.GetHumanoid().AutoRotate = false
        this.alignInstance.Enabled = true
        this.alignInstance.Parent = rootAttachment

        this.connection = RunService.Heartbeat.Connect(() =>
            this.alignInstance.CFrame = this.GetTargetPoint(root)
        )
        return this
    }

    Disable(){
        this.alignInstance.Enabled = false
        this.connection?.Disconnect()
        return this
    }

    constructor(private readonly owner: Player,
        private readonly character: ReloadableCharacter){
            this.mouse = this.owner.GetMouse()

            character.Events.get(CHARACTER_LOAD_EVENT_NAMES.CHARACTER)?.Event.Connect(()=>{
                this.Enable()
            })
    }
}