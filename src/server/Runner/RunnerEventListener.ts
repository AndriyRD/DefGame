import { RunnerStorageContainer } from "./RunnerStorage";
import { IEventListener } from "server/Core/EventSystem/IEventListener";

export class RunnerEventListener implements IEventListener {
    private storage = new RunnerStorageContainer()

    GetId(): string {
        return 'Runner'
    }

    OnRun = (player: Player) => {
        this.storage.Get(player).Run()
    }

    OnStop = (player: Player) => {
        this.storage.Get(player).Stop()
    }
}