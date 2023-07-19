import { Workspace } from "@rbxts/services";
import { CharatcerRaycaster } from "shared/Character/CharatcerRaycaster";
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { GlobalConfig } from "shared/GlobalConfig";

export class ShelterDetector extends CharatcerRaycaster {
    private distance = 2.75

    Cast(){
        return Workspace.Raycast(this.root.Position, this.root.CFrame.LookVector.mul(this.distance), this.rayParams)
    }

    SetDistance(value: number){
        this.distance = value
        return this
    }

    constructor(protected readonly character: ReloadableCharacter){
        super(character, [GlobalConfig.DEBRIS])
    }
}