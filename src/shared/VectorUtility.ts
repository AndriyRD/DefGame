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

    static NormalToFaceID(cf: CFrame, normal: Vector3){
        const THETA = .001

        for (const noramlID of VectorUtility.FaceNormalIDs) {
            const normalVector = cf.VectorToWorldSpace(Vector3.FromNormalId(noramlID))
            if(normalVector.Dot(normal) > (1-THETA))
                return noramlID
        }
        error(`Not correct normal: ${normal}`)
    }

    static NoramlToSurfaceWorldNormal(part: BasePart, normal: Vector3){
        const surfaceID = VectorUtility.NormalToFaceID(part.CFrame, normal)
        const objectPoint = Vector3.FromNormalId(surfaceID).mul(part.Size.div(2))
        return part.CFrame.PointToWorldSpace(objectPoint) 
    }

    static GetDistance(pos1: Vector3, pos2: Vector3){
        return pos1.sub(pos2).Magnitude
    }
}