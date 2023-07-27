import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { Building } from "shared/BuildSystem/Building/Building";
import { BuildingManager } from "shared/BuildSystem/Building/BuildingManager";
import { FactoryMap } from "shared/FactoryMap_v2";
import { MachineGun } from "./Buildings/MachineGun";
import { Wall } from "./Buildings/Wall";
import { InstanceCache } from "shared/InstanceCache/InstanceCache";
import { Workspace } from "@rbxts/services";
import { GlobalConfig } from "shared/GlobalConfig";
import { IBuildingCreateData } from "shared/BuildSystem/IBuildingCreateData";

export class ClientBuildingManger extends BuildingManager {
    private modelContainer = Workspace
    private buildingCache = new InstanceCache<Model>()
        .SetMaxLifeTime(2400)

    private FindModelByGlobalID(id: number){
        for (const item of this.modelContainer.GetChildren()) {
            if(!this.buildingCache.Exist(tostring(id))){
                if(item.IsA("Model")){
                    const idInst = item.FindFirstChild(
                        GlobalConfig.BUILDING_GLOBAL_ID_INSTANCE_NAME)
                    if(idInst && idInst.IsA("StringValue"))
                        return item
                }
            }
        }
    }

    Build(globalID: number) {
        const model = this.FindModelByGlobalID(globalID)
        if(!model) error(`Not found building model by global id: ${globalID}`)
        const id = model.Name
        const createBuilding = this.factories.Find(id as any)
        if(!createBuilding) error(`Not found building by id: ${id}`)
        const building = createBuilding({Model: model, ID: globalID})
        this.buildings.set(model, building)
        const data = {Model: model, ID: globalID}
        this.buildingCache.AddItem(tostring(globalID), model)
        return data
    }
    
    constructor(){
        super(new FactoryMap<BUILDINGS_IDS, Building, IBuildingCreateData>()
            .Set(BUILDINGS_IDS.MACHINE_GUN, (v: IBuildingCreateData) => new MachineGun(v)) 
            .Set(BUILDINGS_IDS.BASE_WALL, (v: IBuildingCreateData) => new Wall(v))
        )
    }
}