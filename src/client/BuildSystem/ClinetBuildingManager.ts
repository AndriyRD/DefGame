import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { Building } from "shared/BuildSystem/Building/Building";
import { BuildingManager } from "shared/BuildSystem/Building/BuildingManager";
import { FactoryMap } from "shared/FactoryMap_v2";
import { MachineGun } from "./Buildings/MachineGun";
import { Wall } from "./Buildings/Wall";

export class ClientBuildingManger extends BuildingManager {
    Build(model: Model): Model {
        const id = model.Name as any
        const createBuilding = this.factories.Find(id)
        if(!createBuilding) error(`Not found building by id: ${id}`)
        const building = createBuilding(model)
        this.buildings.set(model, building)
        return model
    }
    
    constructor(){
        super(new FactoryMap<BUILDINGS_IDS, Building, Model>()
            .Set(BUILDINGS_IDS.MACHINE_GUN, (m) => new MachineGun(m)) 
            .Set(BUILDINGS_IDS.BASE_WALL, (m) => new Wall(m)) 
        )
    }
}