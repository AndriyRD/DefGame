import { RunService, Workspace } from "@rbxts/services";
import { CharatcerRaycaster } from "shared/Character/CharatcerRaycaster";
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { GlobalConfig } from "shared/GlobalConfig";

export class CoverDatector extends CharatcerRaycaster {
    private distance = 2.75
    private connection: RBXScriptConnection | undefined
    readonly OnDetect = new Instance('BindableEvent')

    Cast(){
        return Workspace.Raycast(this.root.Position, this.root.CFrame.LookVector.mul(this.distance), this.rayParams)
    }

    SetDistance(value: number){
        this.distance = value
        return this
    }

    StartDetectMode(){
        this.connection = RunService.Heartbeat.Connect(() => {
            const res = this.Cast()
            if(res){
                this.OnDetect.Fire(res)
                this.connection?.Disconnect()
            }
        })
    }

    constructor(protected readonly character: ReloadableCharacter){
        super(character, [GlobalConfig.DEBRIS])
    }
}