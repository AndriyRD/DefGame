import { FactoryMap } from "shared/FactoryMap_v2";
import { IActionBuilding } from "./IActionBuilding";
import { BUILDINGS_IDS } from "./BUILDINGS_IDS";
import { GlobalConfig } from "shared/GlobalConfig";
import { Reflection } from "shared/Reflection";
import { Building } from "./Building";
import { IBuildingCreateData } from "../IBuildingCreateData";

export abstract class BuildingManager {
    protected readonly buildings = new Map<Model, Building>

    FindBuildingByModel(model: Model){
        const building = this.buildings.get(model)
        if(!building) error(`Not found buildng in manager`)
        return building
    }

    abstract Build(...params: any): IBuildingCreateData

    Destroy(){
        //TODO: Destroy building
        warn()
    }

    constructor(protected readonly factories: FactoryMap<BUILDINGS_IDS, Building, IBuildingCreateData>){}
}