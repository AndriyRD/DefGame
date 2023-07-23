import { GAME_MODE_IDS } from "shared/GameLoader/GAME_MODE_IDS";
import { IGameMode } from "../IGameMode";
import { WeaponProvider } from "client/Weapon/WeaponProvider";
import { WeaponReplicator } from "client/Weapon/ReplicateWeapon/WeaponFireReplicator";
import { ClientEquipmentManager } from "client/Equipment/ClientEquipmentManager";
import { Runner } from "client/Runner/ClientRunner";
import { Players } from "@rbxts/services";
import BuildUI from "../../UI/App";
import { PlayerBuildModule } from "client/BuildSystem/PlayerBuildModule";

export abstract class BaseGameMode implements IGameMode {
    Run(): IGameMode {
        new WeaponProvider()
        new WeaponReplicator().Run()
        new ClientEquipmentManager().Startup()
        new Runner(Players.LocalPlayer, '845386501').Bind()
        new PlayerBuildModule()
        BuildUI()
        return this;
    }

    Dispose(): void {
        
    }

    abstract GetID(): GAME_MODE_IDS
}