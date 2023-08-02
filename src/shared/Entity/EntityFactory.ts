import GetPlayerByCharacter from "shared/Character/GetPlayerByCharacter";
import { PlayerEntity } from "./PlayerEntity";
import { Entity } from "./Entity";

export class EntityFactory{
    static Create(model: Model){
        const plr = GetPlayerByCharacter(model)
        if(plr)
            return new PlayerEntity(plr)
        else 
            return new Entity(model)
    }
}