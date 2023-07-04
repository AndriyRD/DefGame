import { GameModeLoader } from "./GameModeLoader"
import { TeamWarsGameMode } from "./GameMods/TeamWarsGameMode"

export class GameSessionManager {
    private currentModeLoader: GameModeLoader | undefined

    NewSession(){
        if (this.currentModeLoader)
            this.currentModeLoader.Unload()
        this.currentModeLoader = new TeamWarsGameMode().Load('Test')
    }
}