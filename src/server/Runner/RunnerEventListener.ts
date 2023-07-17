import { BaseEventListener } from "server/Core/EventSystem/BaseEventListener";
import { RunnerStorageContainer } from "./RunnerStorageContainer";

export class RunnerEventListener extends BaseEventListener {
    private storage = new RunnerStorageContainer()

    GetId(): string {
        return 'Runner'
    }

    protected OnRun(player: Player){
        this.storage.Get(player).Run()
    }

    protected OnStop(player: Player){
        this.storage.Get(player).Stop()
    }

    constructor(){
        super()
        this.EventHandler.set('Run', (plr: Player) => this.OnRun(plr))
        this.EventHandler.set('Stop', (plr: Player) => this.OnStop(plr))
    }
}