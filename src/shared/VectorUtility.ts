export class VectorUtility {
    private static readonly random = new Random(tick())
    static readonly FaceNormalIDs = [
        Enum.NormalId.Front,
        Enum.NormalId.Back,
        Enum.NormalId.Bottom,
        Enum.NormalId.Top,
        Enum.NormalId.Left,
        Enum.NormalId.Right
    ]

    static CreateVectorByAxis(getAxis: () => number){
        return new Vector3(
            getAxis(),
            getAxis(),
            getAxis())
    }

    static CreateRandomVector(min: number, max: number){
        const getAxis = () => this.random.NextNumber(min, max)
        return this.CreateVectorByAxis(() => getAxis())
    }

    static NormalToFaceID(normal: Vector3){
        const THETA = .001

        for (const noramlID of VectorUtility.FaceNormalIDs) {
            if(Vector3.FromNormalId(noramlID).Dot(normal) > (1-THETA))
                return noramlID
        }
        error(`Not correct normal: ${normal}`)
    }

    static NormalIDToVector(part: BasePart, normalID: Enum.NormalId){
        return part.CFrame.PointToWorldSpace(Vector3.FromNormalId(normalID))
    }

    static NoramlToSurfaceWorldNormal(part: BasePart, normal: Vector3){
        const surfaceID = VectorUtility.NormalToFaceID(normal)
        const objectPoint = Vector3.FromNormalId(surfaceID).mul(part.Size.div(2))
        return part.CFrame.PointToWorldSpace(objectPoint) 
    }
}