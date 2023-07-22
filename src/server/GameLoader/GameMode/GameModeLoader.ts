import { MapManager } from "../GameMap/MapManager"
import { IGameModeDescription } from "./IGameModeDescription"

export abstract class GameModeLoader {
    static readonly ID: string
    protected readonly description: IGameModeDescription = {
        TeamOptions: undefined,
        ProductOptions: undefined,
        MapIDList: ['']
    }
    protected readonly mapManager: MapManager

    Load(mapID: string){
        this.mapManager.Select(mapID)
        return this
    }
    
    abstract Unload(): void

    constructor(){
        this.mapManager = new MapManager(this.description.MapIDList)
    }
}