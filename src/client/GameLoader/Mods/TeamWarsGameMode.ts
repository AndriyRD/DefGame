import { GAME_MODE_IDS } from "shared/GameLoader/GAME_MODE_IDS";
import { BaseGameMode } from "./BaseGameMode";

export class TeamWarsGameMode extends BaseGameMode {
    GetID(): GAME_MODE_IDS {
        return GAME_MODE_IDS.TEAM_WARS
    }
}