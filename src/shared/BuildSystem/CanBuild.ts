import { Workspace } from "@rbxts/services"
import { GlobalConfig } from "shared/GlobalConfig"

const mapContainer = Workspace.WaitForChild(GlobalConfig.LAODED_MAP_NAME)
const params = new OverlapParams()
params.FilterType = Enum.RaycastFilterType.Exclude
params.FilterDescendantsInstances = [mapContainer]

export = (build: Model, cf: CFrame) => {
    const size = build.GetBoundingBox()[1]
    params.FilterDescendantsInstances.push(build)
    const parts = Workspace.GetPartBoundsInBox(cf, size, params)
    if (parts.size() > 0)
        return false
    return true
}