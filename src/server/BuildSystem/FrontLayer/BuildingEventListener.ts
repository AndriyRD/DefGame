import { ReplicatedStorage, Workspace } from "@rbxts/services";
import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { ServerBuildingManager } from "../ServerBuildingManager";
import CanBuild from "shared/BuildSystem/CanBuild";
import { GlobalConfig } from "shared/GlobalConfig";
import { RemoteProvider } from "shared/RemoteProvider";
import { IEventListener } from "server/Core/EventSystem/IEventListener";

export class BuildingEventListener implements IEventListener {
    private readonly buildManger = new ServerBuildingManager()
    private readonly modelContaiener = Workspace
    private readonly buildBuildingEvent = RemoteProvider.GetForBuild().Build

    GetId(): string {
        return 'Build';
    }

    protected GetModel(id: string){
        return GlobalConfig.BUILDING_MODEL_STORAGE.FindFirstChild(id) as Model
    }

    OnBuild = (plr: Player, id: BUILDINGS_IDS, cf: CFrame) => {
        const originModel = this.GetModel(id)
        const canBuild = CanBuild(originModel, cf)
        print(canBuild)
        if(canBuild){
            const data = this.buildManger.Build(id, cf)
            data.Model.Parent = this.modelContaiener
            data.Model.PivotTo(cf)
            this.buildBuildingEvent.FireAllClients(data.Model)
        }
    }
}