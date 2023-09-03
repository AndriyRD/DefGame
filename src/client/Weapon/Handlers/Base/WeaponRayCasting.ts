import { Workspace } from "@rbxts/services"
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter"
import { GlobalConfig } from "shared/GlobalConfig"

export class WeaponRayCasting {
    private readonly rayParams = new RaycastParams()
    private readonly char: ReloadableCharacter
    private readonly RANGE = 100
    private readonly endPointOffset = new Vector3(0,0,-this.RANGE)

    Cast(){ 
        const root = this.char.GetRoot()
        const dir = root.CFrame.LookVector.mul(this.RANGE)
        const res = Workspace.Raycast(
            root.Position, dir, this.rayParams)

        return {
            RaycastResult: res,
            EndPoint: root.CFrame.PointToWorldSpace(this.endPointOffset)
        }
    }

    constructor(private readonly owner: Player, weaponModel: Model | undefined){
        this.char = new ReloadableCharacter(owner)
        const ignoreList = [
            this.char.GetCharacter(),
            GlobalConfig.DEBRIS,
        ] 

        weaponModel ? ignoreList.push(weaponModel) : undefined;

        this.rayParams.FilterType = Enum.RaycastFilterType.Exclude
        this.rayParams.FilterDescendantsInstances = ignoreList
    }
}