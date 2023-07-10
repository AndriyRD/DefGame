import { IBuilding } from "../IBuilding";
import { BuildingController } from "../BuildingController";

export class BaseBuildingController extends BuildingController{
    Startup(): BuildingController {
        return this
    }

    Register(building: IBuilding) {

        return super.Register(building)
    }

}