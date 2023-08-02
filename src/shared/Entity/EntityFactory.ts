import GetPlayerByCharacter from "shared/Character/GetPlayerByCharacter";
import { PlayerEntity } from "./PlayerEntity";
import { Entity } from "./Entity";
import { NpcEntity } from "./NPCEntity";

export class EntityFactory{
    static Create(model: Model){
        const hum = model.FindFirstAncestorOfClass('Humanoid')
        const plr = GetPlayerByCharacter(model)
        if(hum)
            if(plr) return new PlayerEntity(plr)
            else return new NpcEntity(model)
        else
            return new Entity(model)
    }
}