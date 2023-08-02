import { Teams } from "@rbxts/services"

export class TeamManager {
    CreateTeam(color: BrickColor, name: string = `${color.Name}`){
        const team = new Instance('Team', Teams)
        team.TeamColor = color
        team.AutoAssignable = false
        team.PlayerAdded.Connect((plr) => print(`New player: ${plr} in team: ${team}`))
        team.Name = name
        return this
    }
}