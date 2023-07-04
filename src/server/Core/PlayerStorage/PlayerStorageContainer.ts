import { Players } from "@rbxts/services";
import { BasePlayerStorage } from "./BasePlayerStorage";

export class PlayerStorageContainer<K, T> {
    private readonly StorageCotnaier = new Map<Player, BasePlayerStorage<K, T>>()
    private readonly PLAYER_LEAVE_CONNECT: RBXScriptConnection

    Get(player: Player){
        const storage = this.StorageCotnaier.get(player)
        if (storage)
            return storage
        else 
            error(`Not found player-storage for: ${player}`)
    }

    TryGet(player: Player){
        return this.StorageCotnaier.get(player) 
    }

    protected AddItem(player: Player, key: K, item: T){
        let storage = this.TryGet(player)
        if (!storage)
            storage = new BasePlayerStorage(player)
        storage.AddItem(key, item)
    }

    protected OnPlayerLeave(player: Player){
        const storage = this.TryGet(player)
        if (storage){
            storage.Unload()
            table.clear(storage as any)
            this.StorageCotnaier.set(player, undefined as any)
        }
        warn(`Unload player-data for: ${player}`)
    }

    constructor(){
        this.PLAYER_LEAVE_CONNECT = Players.PlayerRemoving.Connect((plr) => 
            this.OnPlayerLeave(plr))
    }
}