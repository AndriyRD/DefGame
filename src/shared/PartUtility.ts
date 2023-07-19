export class PartUtility {
    static readonly facesAxis = {
        [Enum.NormalId.Back.Value]: 'X',
        [Enum.NormalId.Front.Value]: 'X',
        [Enum.NormalId.Left.Value]: 'Z',
        [Enum.NormalId.Right.Value]: 'Z',
        [Enum.NormalId.Top.Value]: 'Y',
        [Enum.NormalId.Bottom.Value]: 'Y' 
    }
    
    static GetFaceSize(part: BasePart, normalID: Enum.NormalId){
        const axisName = this.facesAxis[normalID.Value]
        if(axisName === 'X')
            return part.Size.X
        else if(axisName === 'Y')
            return part.Size.Y
        else if(axisName === 'Z')
            return part.Size.Z
        error(`Not found axis by normalID: ${normalID}`)
    }
}