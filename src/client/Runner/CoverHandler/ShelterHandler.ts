import { Debris, RunService, Workspace } from "@rbxts/services"
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter"
import { ShelterDetector } from "./ShelterDetector"
import { VectorUtility } from "shared/VectorUtility"
import { GlobalConfig } from "shared/GlobalConfig"
import { PartUtility } from "shared/PartUtility"

const createPart = (pos: Vector3, color: BrickColor) => {
    const part = new Instance('Part', GlobalConfig.DEBRIS)
    part.BrickColor = color
    part.Anchored = true
    part.CanCollide = false
    part.Material = Enum.Material.Neon
    part.Size = new Vector3(.5,.5,.5)
    part.Position = pos
    return part
}

export class ShelterHandler {
    private readonly detector
    private connection: RBXScriptConnection | undefined

    Start(){
        this.connection = RunService.Heartbeat.Connect(() => {
            const res = this.detector.Cast()
            if(res){
                const normalID = VectorUtility.NormalToFaceID(res.Normal)
                createPart(VectorUtility.NoramlToSurfaceWorldNormal(res.Instance, res.Normal), BrickColor.Blue())
                print(PartUtility.GetFaceSize(res.Instance, normalID))
            }
        })
    }

    constructor(private readonly character: ReloadableCharacter){
        this.detector = new ShelterDetector(character)
    }
}