import { GAME_MODE_IDS } from "shared/GameLoader/GAME_MODE_IDS";
import { BaseGameMode } from "../BaseGameMode";
import { IGameMode } from "client/GameLoader/IGameMode";
import { TeamScene } from "./TeamScene";
import { EventProvider } from "client/EventProvider";

export class TeamWarsGameMode extends BaseGameMode {
    private readonly teamScene = new TeamScene()
    GetID(): GAME_MODE_IDS {
        return GAME_MODE_IDS.TEAM_WARS
    }

    private OnSelectTeam(name: string){
        EventProvider.CharatcerController.Camera.Enable.Fire()
    }

    Run(): IGameMode {
        EventProvider.CharatcerController.Camera.Disable.Fire()
        this.teamScene.Show()
        this.teamScene.OnSelect.Event.Connect((name) => this.OnSelectTeam(name))
        return super.Run()
    }
}