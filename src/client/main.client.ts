import { ReplicatedStorage } from "@rbxts/services";
import { GameLoader } from "./GameLoader/ClientGameLoader";
import { TeamWarsGameMode } from "./GameLoader/Mods/TeamWarsGameMode";
const remote = ReplicatedStorage.WaitForChild('Equipment').WaitForChild('Remote') as Folder
const craeteEquipmentEvent = remote.WaitForChild('CreateEquipment') as RemoteEvent

// craeteEquipmentEvent.FireServer('RocketLauncher')

new GameLoader()
    .RegisterGameMode(new TeamWarsGameMode())
    .Startup()
craeteEquipmentEvent.FireServer('AK47')