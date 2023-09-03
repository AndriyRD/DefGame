import { Workspace } from "@rbxts/services"
import { GlobalConfig } from "shared/GlobalConfig"
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter"

export class WeaponRayCasting {
    private readonly rayParams = new RaycastParams()
    private readonly char: ReloadableCharacter
    private readonly RANGE = 100
    private readonly endPointOffset = new Vector3(0,0,-this.RANGE)
    private readonly mouse

    private GetDirection(startCF:CFrame){
        return CFrame.lookAt(startCF.Position, this.mouse.Hit.Position)
            .LookVector
            .mul(this.RANGE)
    }

    Cast(){ 
        const root = this.char.GetRoot()
        const origin = root.Position
        const res = Workspace.Raycast(origin, this.GetDirection(root.CFrame), this.rayParams)

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
        this.mouse = owner.GetMouse()
    }
}