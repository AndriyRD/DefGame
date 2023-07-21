import { PartFace } from "shared/PartApi/PartFace";
import { VectorUtility } from "shared/VectorUtility";

export class Cover extends PartFace {
    private readonly minDisatnceToEndPoint = .5

     protected GetDistacneToEndPoint(pos: Vector3, toRight: boolean){
        if(toRight)
            return VectorUtility.GetDistance(pos, this.endPoints.Right.Position)
        else 
            return VectorUtility.GetDistance(pos, this.endPoints.Left.Position)
    }

    CanWatch(pos: Vector3){
        if (this.GetDistacneToEndPoint(pos, true))
            return true
        else if (this.GetDistacneToEndPoint(pos, false))
            return true
        return false
    }
}