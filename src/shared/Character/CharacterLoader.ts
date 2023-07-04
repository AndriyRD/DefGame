import { ReloadableCharacter } from "./ReloadableCharacter";

export class CharacterLaoder {
    Create(player: Player){
        return new ReloadableCharacter(player)
    }
}