import { IGameMode } from "./IGameMode";

export class GameSessionLoader {
    private currentGameMode: IGameMode | undefined

    NewSession(gameMode: IGameMode){
        this.currentGameMode = gameMode
        gameMode.Run()
    }
    
    LoadMap(map: Model){
        this.currentGameMode?.Run()
    }

    UnloadMap(){
        this.currentGameMode?.Dispose()
    }
}