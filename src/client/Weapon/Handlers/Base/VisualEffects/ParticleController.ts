import { SmokeGenerator } from "./SmokeGenerator";

export class ParticleController {
    private readonly smokeGenerator = new SmokeGenerator()

    private Smoke(startPos: CFrame, dir: Vector3, distance: number){
        this.smokeGenerator.Generate(startPos, distance)
    }

    Shot(start: CFrame, endPos: Vector3){
        const startPos = start.Position
        const dir = CFrame.lookAt(startPos, endPos)
        const distance = (startPos.sub(endPos)).Magnitude
        this.Smoke(start, dir.LookVector, distance)
    }
}