import { EventRegister } from "server/Core/EventSystem/EventRegister";
import { GameModeLoader } from "../GameModeLoader";
import { IGameModeDescription } from "../IGameModeDescription";
import { MapManager } from "../MapManager";
import { WeaponEventListener } from "server/Weapon/FrontLayer/WeaponEventListener";
import { EquipmentEventListener } from "server/Equipment/FrontLayer/EquipmentEventListener";
import { ApiServiceRegister } from "server/Core/ApiService/ApiServiceRegister";
import { EquipmentService } from "server/Equipment/FrontLayer/EquipmentService";
import { RunnerEventListener } from "server/Runner/RunnerEventListener";

export class TeamWarsGameMode extends GameModeLoader{
    static readonly ID = 'TeamWars'
    protected readonly description: IGameModeDescription = {
        TeamOptions: undefined,
        ProductOptions: undefined,
        MapIDList: ['Test']
    }
    protected mapManager: MapManager = new MapManager(this.description.MapIDList);

    private RunEventListeners(){
        new EventRegister()
            .Register(new WeaponEventListener())
            .Register(new EquipmentEventListener())
            .Register(new RunnerEventListener())
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

    constructor(){
        super()
        print(this.description.MapIDList[0])
    }
}