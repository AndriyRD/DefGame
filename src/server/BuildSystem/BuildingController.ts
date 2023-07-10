import { IBuilding } from "./IBuilding";

export abstract class BuildingController {
    protected readonly buildingList = new Array<IBuilding>()

    abstract Startup(): BuildingController
    
    Register(building: IBuilding){
        this.buildingList.push(building)
        return this
    }
}