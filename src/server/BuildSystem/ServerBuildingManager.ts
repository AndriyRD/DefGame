import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { BuildingManager } from "shared/BuildSystem/Building/BuildingManager";
import { IActionBuilding } from "shared/BuildSystem/Building/IActionBuilding";
import { FactoryMap } from "shared/FactoryMap_v2";
import { MachineGun } from "./Buildings/ServerMachineGun";
import { Reflection } from "shared/Reflection";
import { GlobalConfig } from "shared/GlobalConfig";
import { Wall } from "./Buildings/ServerWall";
import { IdentifiedInstance } from "shared/IdentifiedInstance";

export class ServerBuildingManager extends BuildingManager{
    Build(id: BUILDINGS_IDS, cf: CFrame) {
        const createBuilding = this.factories.Find(id)
        if(!createBuilding) error(`Not found building by id: ${id}`)
        const buidlignModel = GlobalConfig.BUILDING_MODEL_STORAGE.WaitForChild(id) as Model
        if(!buidlignModel) error(`Nor found model for buildnig: ${id}`)

        const model = new IdentifiedInstance<Model>(buidlignModel.Clone())

        const building = createBuilding(model)
        this.buildings.set(model.GetInstance(), building)
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
        super(new FactoryMap<BUILDINGS_IDS, IActionBuilding, IdentifiedInstance<Model>>()
        .Set(BUILDINGS_IDS.MACHINE_GUN, (v: IdentifiedInstance<Model>) => new MachineGun(v)) 
        .Set(BUILDINGS_IDS.BASE_WALL, (v: IdentifiedInstance<Model>) => new Wall(v))
    )
    }
}