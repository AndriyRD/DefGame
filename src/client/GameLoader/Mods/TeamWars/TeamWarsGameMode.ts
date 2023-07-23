import { GAME_MODE_IDS } from "shared/GameLoader/GAME_MODE_IDS";
import { BaseGameMode } from "../BaseGameMode";
import { IGameMode } from "client/GameLoader/IGameMode";
import { TeamScene } from "./TeamScene";

export class TeamWarsGameMode extends BaseGameMode {
    private readonly teamScene = new TeamScene()
    GetID(): GAME_MODE_IDS {
        return GAME_MODE_IDS.TEAM_WARS
    }

    Run(): IGameMode {
        //TODO: this.teamScene.Show()
        return super.Run()
    }
}