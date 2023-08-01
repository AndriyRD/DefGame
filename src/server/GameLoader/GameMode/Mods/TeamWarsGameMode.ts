import { EventRegister } from "server/Core/EventSystem/EventRegister";
import { GameModeLoader } from "../GameModeLoader";
import { IGameModeDescription } from "../IGameModeDescription";
import { WeaponEventListener } from "server/Weapon/FrontLayer/WeaponEventListener";
import { EquipmentEventListener } from "server/Equipment/FrontLayer/EquipmentEventListener";
import { ApiServiceRegister } from "server/Core/ApiService/ApiServiceRegister";
import { EquipmentService } from "server/Equipment/FrontLayer/EquipmentService";
import { RunnerEventListener } from "server/Runner/RunnerEventListener";
import { GAME_MODE_IDS } from "shared/GameLoader/GAME_MODE_IDS";
import { MapManager } from "server/GameLoader/GameMap/MapManager";
import { BuildingEventListener } from "server/BuildSystem/FrontLayer/BuildingEventListener";

export class TeamWarsGameMode extends GameModeLoader{
    readonly ID = GAME_MODE_IDS.TEAM_WARS
    protected readonly description: IGameModeDescription = {
        TeamOptions: undefined,
        ProductOptions: undefined,
    }
    protected mapManager: MapManager = new MapManager();

    private RunEventListeners(){
        new EventRegister()
            .Register(new WeaponEventListener())
            .Register(new EquipmentEventListener())
            .Register(new RunnerEventListener())
            .Register(new BuildingEventListener())
    }

    private RunApiServices(){
        new ApiServiceRegister()
            .Register(new EquipmentService())
    }

    Load(mapID: string){
        this.RunApiServices()
        this.RunEventListeners()
        return super.Load(mapID)
    }

    Unload(): void {
        
    }
}