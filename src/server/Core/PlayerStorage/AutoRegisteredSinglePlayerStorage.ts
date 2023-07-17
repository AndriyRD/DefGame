import { Players } from "@rbxts/services";
import { SinglePlayerStorage } from "./SinglePlayerStorage";

export abstract class AutoRegisteredSinglePlayerStorage<T> extends SinglePlayerStorage<T>{
    protected readonly connections
    protected abstract RemoveItem(plr: Player): void

    protected OnPlayerJoin(plr: Player){
        this.items.set(plr, this.CreateItem(plr))
    }

    protected OnPlayerLeave(plr: Player){
        this.RemoveItem(plr)
        this.items.delete(plr)
    }

    constructor(){
        super()
        this.connections = {
            OnPlayerJoin: Players.PlayerAdded.Connect((plr: Player) => this.OnPlayerJoin(plr)),
            OnPlayerLeave: Players.PlayerRemoving.Connect((plr: Player) => this.OnPlayerLeave(plr))
        }
    }
}