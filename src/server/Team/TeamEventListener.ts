import { Teams } from "@rbxts/services";
import { IEventListener } from "server/Core/EventSystem/IEventListener";

export class TeamEventListener implements IEventListener {
    GetId(): string {
        return 'Team'
    }

    OnJoinToTeam = (plr: Player, teamName: string) => {
        plr.Team = Teams.GetTeams().find((v) => v.Name === teamName)
    }
}