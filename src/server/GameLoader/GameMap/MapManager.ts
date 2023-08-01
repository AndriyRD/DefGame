import { FactoryMap } from "shared/FactoryMap"
import { GameMap } from "./GameMap"

export class MapManager {
    private readonly gameMaps = new Map<string, GameMap>
    private currentMap: GameMap | undefined 

    Select(id: string){
        const newMap = this.gameMaps.get(id)
        if (!newMap) error(`Not found game-map: ${id}`)
        this.currentMap?.Destory()
        this.currentMap = newMap
        this.currentMap.Sapwn()
        return this.currentMap
    }

    RegisterMap(gameMap: GameMap){
        this.gameMaps.set(gameMap.GetID(), gameMap)
        return this
    }
}