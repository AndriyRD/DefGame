import { Players } from "@rbxts/services";
import GetCharacter from "./GetCharacter";

export = (char: Model) => {
    for (const plr of Players.GetPlayers()) {
        const plrChar = GetCharacter(plr)
        if(char === plrChar) return plr
    }
}