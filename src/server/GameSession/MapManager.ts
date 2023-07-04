import { FactoryMap } from "shared/FactoryMap"
import { GameMap } from "./GameMap"
import { Workspace } from "@rbxts/services"

export class MapManager {
    private readonly factories
    private currentMap: GameMap | undefined 

    Select(id: string){
        const newMap = this.factories.Find(id)
        if (!newMap) error(`Not found game-map: ${id}`)
        this.currentMap?.Destory()
        this.currentMap = newMap()
        this.currentMap.GetModel().Parent = Workspace
        return this.currentMap
    }

    constructor(private readonly list: [string]){
        this.factories = new FactoryMap<string, GameMap>()

        for (const name of list) {
            this.factories.Set(name, () => new GameMap(name))
        }
    }
}