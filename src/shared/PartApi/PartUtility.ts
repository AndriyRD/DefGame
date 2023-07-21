export enum AXIS {
    X = 'X',
    Y = 'Y',
    Z = 'Z'
}

export class PartUtility {
    static readonly facesAxis = {
        [Enum.NormalId.Back.Value]: AXIS.X,
        [Enum.NormalId.Front.Value]: AXIS.X,
        [Enum.NormalId.Left.Value]: AXIS.Z,
        [Enum.NormalId.Right.Value]: AXIS.Z,
        [Enum.NormalId.Top.Value]: AXIS.Y,
        [Enum.NormalId.Bottom.Value]: AXIS.Y 
    }

    static IsPositiveAxisByNormalID(normalID: Enum.NormalId){
        if(normalID === Enum.NormalId.Front || normalID === Enum.NormalId.Right || normalID === Enum.NormalId.Top)
            return true; else return false
    }

    static GetFaceSize(part: BasePart, normalID: Enum.NormalId){
        const axisName = this.facesAxis[normalID.Value]
        if(axisName === AXIS.X)
            return new Vector3(1,0,0).mul(part.Size.X)
        else if(axisName === AXIS.Y)
            return new Vector3(0,1,0).mul(part.Size.Y)
        else if(axisName === AXIS.Z)
            return new Vector3(0,0,1).mul(part.Size.Z)
        error(`Not found axis by normalID: ${normalID}`)
    }

    static CreatePart(pos: Vector3, parent: Instance){
        const part = new Instance('Part', parent)
        part.BrickColor = BrickColor.Red()
        part.Anchored = true
        part.CanCollide = false
        part.Material = Enum.Material.Neon
        part.Size = new Vector3(.5,.5,.5)
        part.Position = pos
        return part
    }
}