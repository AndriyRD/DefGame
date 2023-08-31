import { FactoryMap } from "shared/FactoryMap_v2";
import { BUILDINGS_IDS } from "./BUILDINGS_IDS";
import { Building } from "./Building";
import { IdentifiedInstance } from "shared/IdentifiedInstance";

export abstract class BuildingManager {
    protected readonly buildings = new Map<Model, Building>

    FindBuildingByModel(model: Model){
        const building = this.buildings.get(model)
        if(!building) error(`Not found buildng in manager`)
        return building
    }

    abstract Build(...params: any): IdentifiedInstance<Model>

    Destroy(){
        //TODO: Destroy building
        warn()
    }

    constructor(protected readonly factories: FactoryMap<BUILDINGS_IDS, Building, IdentifiedInstance<Model>>){}
}