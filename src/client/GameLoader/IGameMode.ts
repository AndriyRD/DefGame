import { GAME_MODE_IDS } from "shared/GameLoader/GAME_MODE_IDS"

export interface IGameMode {
    Run(): IGameMode
    Dispose(): void
    GetID(): GAME_MODE_IDS
}