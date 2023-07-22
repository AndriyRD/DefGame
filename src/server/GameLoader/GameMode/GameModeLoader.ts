import { GlobalConfig } from "shared/GlobalConfig"
import { MapManager } from "../GameMap/MapManager"
import { IGameModeDescription } from "./IGameModeDescription"
import { GAME_MODE_IDS } from "shared/GameLoader/GAME_MODE_IDS"

export abstract class GameModeLoader {
    abstract readonly ID: GAME_MODE_IDS
    protected readonly description: IGameModeDescription = {
        TeamOptions: undefined,
        ProductOptions: undefined,
        MapIDList: ['']
    }
    protected abstract readonly mapManager: MapManager

    Load(mapID: string){
        const map = this.mapManager.Select(mapID).GetModel()
        map.SetAttribute(GlobalConfig.ATTRIBUTES_NAMES.GAME_MODE, this.ID)
        map.SetAttribute(GlobalConfig.ATTRIBUTES_NAMES.IS_STARTING_GAME, true)
        return this
    }
    
    abstract Unload(): void
}