import { PlayerStorageContainer } from "server/Core/PlayerStorage/PlayerStorageContainer";
import { SinglePlayerStorage } from "server/Core/PlayerStorage/SinglePlayerStorage";
import { BaseRunner } from "shared/Runner/BaseRunner";
import { Runner } from "./ServerRunner";

export class RunnerStorageContainer extends SinglePlayerStorage<BaseRunner> {
    protected CreateItem(plr: Player): BaseRunner {
        return new Runner(plr)
    }
}