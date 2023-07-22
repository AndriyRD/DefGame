import { IGameLoader } from "shared/GameLoader/IGameLoader";
import { RemoteProvider } from "shared/RemoteProvider";
import { GameSessionLoader } from "./GameSessionLoader";
import { GAME_MODE_IDS } from "shared/GameLoader/GAME_MODE_IDS";
import { IGameMode } from "./IGameMode";
import { Workspace } from "@rbxts/services";
import { GlobalConfig } from "shared/GlobalConfig";

export class GameLoader implements IGameLoader {
    private readonly remote = RemoteProvider.GetForGameLoader()
    private readonly gameModeSessionLoader = new GameSessionLoader
    private readonly gameMods = new Map<GAME_MODE_IDS, IGameMode>

    private GetMapModel(){
        return Workspace.WaitForChild(GlobalConfig.LAODED_MAP_NAME)
    }

    private IsRunningGame(){
        return this.GetMapModel().GetAttribute(GlobalConfig.ATTRIBUTES_NAMES.IS_STARTING_GAME)
    }

    private GetCurrentGameMode(){
        const currentMap = this.GetMapModel()
        if(!currentMap) error(`Not found game-map`)
        return currentMap.GetAttribute(GlobalConfig.ATTRIBUTES_NAMES.GAME_MODE) as string
    }

    private OnNewSession(gameModeID: string){
        const currentGameMode = this.gameMods.get(gameModeID as any)!
        if(!currentGameMode) error(`Not found game-mode: ${gameModeID}`)
        this.gameModeSessionLoader.NewSession(currentGameMode)
    }

    Startup(): void {
        this.remote.NewSession.OnClientEvent.Connect((mode) => this.OnNewSession(mode))
        if(this.IsRunningGame())
            this.OnNewSession(this.GetCurrentGameMode())
        
    }

    RegisterGameMode(gameMode: IGameMode){
        this.gameMods.set(gameMode.GetID(), gameMode)
        return this
    }
}