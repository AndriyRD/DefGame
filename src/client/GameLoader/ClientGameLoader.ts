import { IGameLoader } from "shared/GameLoader/IGameLoader";
import { RemoteProvider } from "shared/RemoteProvider";
import { GameSessionLoader } from "./GameSessionLoader";
import { GAME_MODE_IDS } from "shared/GameLoader/GAME_MODE_IDS";
import { IGameMode } from "./IGameMode";

export class GameLoader implements IGameLoader {
    private readonly remote = RemoteProvider.GetForGameLoader()
    private readonly gameModeSessionLoader = new GameSessionLoader
    private readonly gameMods = new Map<GAME_MODE_IDS, IGameMode>

    private OnNewSession(gameModeID: string){
        const currentGameMode = this.gameMods.get(gameModeID as any)!
        if(!currentGameMode) error(`Not found game-mode: ${gameModeID}`)
        this.gameModeSessionLoader.NewSession(currentGameMode)
    }

    Startup(): void {
        this.remote.NewSession.OnClientEvent.Connect((mode) => this.OnNewSession(mode))
    }

    RegisterGameMode(gameMode: IGameMode){
        this.gameMods.set(gameMode.GetID(), gameMode)
    }

}