import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { Building } from "shared/BuildSystem/Building/Building";
import { BuildingManager } from "shared/BuildSystem/Building/BuildingManager";
import { FactoryMap } from "shared/FactoryMap_v2";
import { MachineGun } from "./Buildings/MachineGun";
import { Wall } from "./Buildings/Wall";
import { InstanceCache } from "shared/InstanceCache/InstanceCache";
import { Workspace } from "@rbxts/services";
import { IdentifiedInstance } from "shared/IdentifiedInstance";

export class ClientBuildingManger extends BuildingManager {
    private modelContainer = Workspace
    private buildingCache = new InstanceCache<Model>()
        .SetMaxLifeTime(2400)

    Build(globalID: number) {
        const identifiedModel = IdentifiedInstance.FindAndWrap<Model>(globalID)!
        const model = identifiedModel.GetInstance()
        if(!model) error(`Not found building model by global id: ${globalID}`)
        const id = model.Name
        const createBuilding = this.factories.Find(id as any)
        if(!createBuilding) error(`Not found building by id: ${id}`)
        const building = createBuilding(identifiedModel)
        this.buildings.set(model, building)
        
        return identifiedModel
    }
    
    constructor(){
        super(new FactoryMap<BUILDINGS_IDS, Building, IdentifiedInstance<Model>>()
            .Set(BUILDINGS_IDS.MACHINE_GUN, (v: IdentifiedInstance<Model>) => new MachineGun(v)) 
            .Set(BUILDINGS_IDS.BASE_WALL, (v: IdentifiedInstance<Model>) => new Wall(v))
        )
    }
}