import { Players } from "@rbxts/services"
import GetCharacter from "shared/Character/GetCharacter"
import { EntityStorage } from "./EntityStorage"

export class EntityStorageFactory {
    static CreateByOtherTeams(ignoreTeam: Team, entityTag: string){
        const playerEntities = new Array<Model>()
        Players.GetPlayers().forEach((v) => {
            if(v.Team !== ignoreTeam)
                playerEntities.push(GetCharacter(v))
        })
        return new EntityStorage(entityTag)
                .AddIfIsEntity(playerEntities)
    }
}