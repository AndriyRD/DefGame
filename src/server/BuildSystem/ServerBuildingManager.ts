import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { BuildingManager } from "shared/BuildSystem/Building/BuildingManager";
import { IActionBuilding } from "shared/BuildSystem/Building/IActionBuilding";
import { FactoryMap } from "shared/FactoryMap_v2";
import { MachineGun } from "./Buildings/ServerMachineGun";
import { Reflection } from "shared/Reflection";
import { GlobalConfig } from "shared/GlobalConfig";
import { Wall } from "./Buildings/ServerWall";

export class ServerBuildingManager extends BuildingManager{
    Build(id: BUILDINGS_IDS, cf: CFrame): Model {
        const createBuilding = this.factories.Find(id)
        if(!createBuilding) error(`Not found building by id: ${id}`)
        const buidlignModel = GlobalConfig.BUILDING_MODEL_STORAGE.WaitForChild(id) as Model
        if(!buidlignModel) error(`Nor found model for buildnig: ${id}`)
        const model = buidlignModel.Clone()
        const building = createBuilding(model)
        this.buildings.set(model, building)
        building.OnBuild()
        return model
    }
    
    UseAction(plr: Player, model: Model, actionName: string){
        const action = Reflection.ConvertObjectToMap<Callback>(this.FindBuildingByModel(model)).get(actionName)
        if(!action) error(`Not found action: ${actionName} for building: ${model}`)
        action(plr)
        return this
    }

    constructor(){
        super(new FactoryMap<BUILDINGS_IDS, IActionBuilding, Model>()
            .Set(BUILDINGS_IDS.MACHINE_GUN, (m) => new MachineGun(m)) 
            .Set(BUILDINGS_IDS.BASE_WALL, (m) => new Wall(m)) 
        )
    }
}