import { SinglePlayerStorage } from "server/Core/PlayerStorage/SinglePlayerStorage";
import { BaseRunner } from "shared/Runner/BaseRunner";
import { Runner } from "./ServerRunner";
import { AutoRegisteredSinglePlayerStorage } from "server/Core/PlayerStorage/AutoRegisteredSinglePlayerStorage";

export class RunnerStorageContainer extends AutoRegisteredSinglePlayerStorage<Runner> {
    protected RemoveItem(plr: Player): void {
        this.Get(plr).Dispose()
    }
    protected CreateItem(plr: Player) {
        return new Runner(plr)
    }
}