import { ReplicatedStorage, Workspace } from "@rbxts/services";
import { BaseEventListener } from "server/Core/EventSystem/BaseEventListener";
import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { ServerBuildingManager } from "../ServerBuildingManager";
import CanBuild from "shared/BuildSystem/CanBuild";
import { GlobalConfig } from "shared/GlobalConfig";
import { RemoteProvider } from "shared/RemoteProvider";

export class BuildingEventListener extends BaseEventListener {
    private readonly buildManger = new ServerBuildingManager()
    private readonly modelContaiener = Workspace
    private readonly buildBuildingEvent = RemoteProvider.GetForBuild().Build

    GetId(): string {
        return 'Build';
    }

    protected GetModel(id: string){
        return GlobalConfig.BUILDING_MODEL_STORAGE.FindFirstChild(id) as Model
    }

    protected OnBuild(plr: Player, id: BUILDINGS_IDS, cf: CFrame){
        const model = this.GetModel(id)
        const canBuild = CanBuild(model, cf)
        print(canBuild)
        if(canBuild){
            const model = this.buildManger.Build(id, cf)
            model.Parent = this.modelContaiener
            model.PivotTo(cf)
            model.PrimaryPart?.SetNetworkOwner(plr)
            print(`Model: ${model}`)
            this.buildBuildingEvent.FireAllClients(model)
        }
    }

    constructor(){
        super()
        this.EventHandler.set('Build', (plr, id, cf) => this.OnBuild(plr, id, cf))
    }

}