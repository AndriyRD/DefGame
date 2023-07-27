import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { BuildingManager } from "shared/BuildSystem/Building/BuildingManager";
import { IActionBuilding } from "shared/BuildSystem/Building/IActionBuilding";
import { FactoryMap } from "shared/FactoryMap_v2";
import { MachineGun } from "./Buildings/ServerMachineGun";
import { Reflection } from "shared/Reflection";
import { GlobalConfig } from "shared/GlobalConfig";
import { Wall } from "./Buildings/ServerWall";
import { IBuildingCreateData } from "shared/BuildSystem/IBuildingCreateData";

export class ServerBuildingManager extends BuildingManager{
    private CreateGlobalIDInstance(buildingModel: Model){
        const idInstance = new Instance("StringValue")
        idInstance.Parent = buildingModel
        idInstance.Name = GlobalConfig.BUILDING_GLOBAL_ID_INSTANCE_NAME
        idInstance.Value = tostring(buildingModel)
        return idInstance
    }

    Build(id: BUILDINGS_IDS, cf: CFrame) {
        const createBuilding = this.factories.Find(id)
        if(!createBuilding) error(`Not found building by id: ${id}`)
        const buidlignModel = GlobalConfig.BUILDING_MODEL_STORAGE.WaitForChild(id) as Model
        if(!buidlignModel) error(`Nor found model for buildnig: ${id}`)

        const model = buidlignModel.Clone()
        this.CreateGlobalIDInstance(model)
        const gId = tick()
        const createData = {Model: model as Model, ID: gId}

        const building = createBuilding(createData)
        this.buildings.set(model, building)
        building.OnBuild()
        return createData
    }
    
    UseAction(plr: Player, model: Model, actionName: string){
        const action = Reflection.ConvertObjectToMap<Callback>(this.FindBuildingByModel(model)).get(actionName)
        if(!action) error(`Not found action: ${actionName} for building: ${model}`)
        action(plr)
        return this
    }

    constructor(){
        super(new FactoryMap<BUILDINGS_IDS, IActionBuilding, IBuildingCreateData>()
        .Set(BUILDINGS_IDS.MACHINE_GUN, (v: IBuildingCreateData) => new MachineGun(v)) 
        .Set(BUILDINGS_IDS.BASE_WALL, (v: IBuildingCreateData) => new Wall(v))
    )
    }
}