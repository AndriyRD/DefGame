import { Players } from "@rbxts/services";
import { IStorage } from "./IStorage";
export abstract class SinglePlayerStorage<T> implements IStorage{
    protected readonly items = new Map<Player, T>()
    
    protected abstract CreateItem(plr: Player): T
    
    Get(player: Player){
        const item = this.items.get(player)
        if (!item)
            error(`Not found item in storage for player: ${player}`)
        return item
    }

    GetOrCreate(player: Player): T{
        let item = this.items.get(player)
        if (!item)
            item = this.items.set(player, this.CreateItem(player)).get(player)
        return item as T
    }
}