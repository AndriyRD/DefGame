import { Workspace } from "@rbxts/services"
import { GlobalConfig } from "shared/GlobalConfig"

let map = undefined as Model | undefined
let tarrain = undefined as Model | undefined
const params = new OverlapParams()
params.FilterType = Enum.RaycastFilterType.Exclude
params.FilterDescendantsInstances = []
const baseplate = Workspace.WaitForChild('Baseplate')

export = (build: Model, cf: CFrame) => {
    // if(!map || !map.Parent) 
    //     map = Workspace.WaitForChild(GlobalConfig.LAODED_MAP_NAME) as Model
    // if(!tarrain || !tarrain.Parent) 
    //     tarrain = map.WaitForChild(GlobalConfig.MAP_TERRAIN_CONTAINER_NAME) as Model

    params.FilterDescendantsInstances = [GlobalConfig.DEBRIS, build, baseplate]
    const size = build.GetBoundingBox()[1]
    params.FilterDescendantsInstances.push(build)
    const parts = Workspace.GetPartBoundsInBox(cf, size, params)
    print(parts[0])
    if (parts.size() > 0)
        return false
    return true
}