import { RemoteProvider } from "shared/RemoteProvider"
import { GameModeLoader } from "../GameMode/GameModeLoader"
import { TeamWarsGameMode } from "../GameMode/Mods/TeamWarsGameMode"
import { GAME_MODE_IDS } from "shared/GameLoader/GAME_MODE_IDS"

export class GameSessionManager {
    private currentModeLoader: GameModeLoader | undefined
    private remote = RemoteProvider.GetForGameLoader()

    NewSession(){
        if (this.currentModeLoader)
            this.currentModeLoader.Unload()
        this.currentModeLoader = new TeamWarsGameMode().Load('Test')
        this.remote.NewSession.FireAllClients(GAME_MODE_IDS.TEAM_WARS)
    }
}