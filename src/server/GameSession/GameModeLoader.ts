import { IGameModeDescription } from "./IGameModeDescription"
import { MapManager } from "./MapManager"

export abstract class GameModeLoader {
    static readonly ID: string
    protected readonly description: IGameModeDescription = {
        TeamOptions: undefined,
        ProductOptions: undefined,
        MapIDList: ['']
    }
    protected abstract readonly mapManager: MapManager

    Load(mapID: string){
        this.mapManager.Select(mapID)
        return this
    }
    
    abstract Unload(): void
}