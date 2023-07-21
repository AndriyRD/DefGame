import { VectorUtility } from "shared/VectorUtility"
import { PartUtility } from "./PartUtility"

export class PartFace {
    protected readonly faceSize: Vector3
    protected readonly CF: CFrame
    protected readonly endPoints: {Left: CFrame, Right: CFrame}
    private readonly normalID: Enum.NormalId

    protected GetEnPoint(positiveAxis: boolean){
        let sizeOffset = this.faceSize.div(2).mul(positiveAxis ? 1 : -1)
        return this.CF.ToWorldSpace(new CFrame(sizeOffset))
    }

    private ParseCF(normal: Vector3){
        let _cf = new CFrame(VectorUtility.NoramlToSurfaceWorldNormal(this.part, normal))
        return _cf.mul(this.part.CFrame.Rotation)
    }

    private ParseEndpoints(){
        return {
            Left: this.GetEnPoint(false),
            Right: this.GetEnPoint(true)
        }
    }

    private ParceFaceSize(){
        return PartUtility.GetFaceSize(this.part, this.normalID)
    }

    GetCFrame(){
        return this.CF
    }

    GetEndRightPoint(){
        return this.endPoints.Right
    }
    
    GetEndLeftPoint(){
        return this.endPoints.Left
    }

    constructor(protected readonly part: BasePart, protected readonly surfaceNormal: Vector3){
        this.normalID = VectorUtility.NormalToFaceID(part.CFrame, surfaceNormal)
        this.CF = this.ParseCF(this.surfaceNormal)
        this.faceSize = this.ParceFaceSize()
        this.endPoints = this.ParseEndpoints()
    }
}