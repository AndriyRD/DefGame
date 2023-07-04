import { Workspace } from "@rbxts/services"
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter"
import { GlobalConfig } from "shared/GlobalConfig"

export class WeaponRayCasting {
    private readonly rayParams = new RaycastParams()
    private readonly char: ReloadableCharacter
    private readonly RANGE = 100

    Cast(){ 
        const root = this.char.GetRoot()
        return Workspace.Raycast(
            root.Position, root.CFrame.LookVector.mul(this.RANGE), this.rayParams)
    }

    constructor(private readonly owner: Player){
        this.char = new ReloadableCharacter(owner)

        this.rayParams.FilterType = Enum.RaycastFilterType.Exclude
        this.rayParams.FilterDescendantsInstances = [
            this.char.GetCharacter(), 
            GlobalConfig.DEBRIS
        ] 
    }
}