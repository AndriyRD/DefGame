import { ReplicatedStorage } from "@rbxts/services";
import { GameLoader } from "./GameLoader/ClientGameLoader";
import { TeamWarsGameMode } from "./GameLoader/Mods/TeamWars/TeamWarsGameMode";
import { CharacterController } from "./CharacterController/CharacterController";
import { ASSET_INSTANCES, AssetInstance } from "shared/AssetInstance/AssetInstance";
const remote = ReplicatedStorage.WaitForChild('Equipment').WaitForChild('Remote') as Folder
const craeteEquipmentEvent = remote.WaitForChild('CreateEquipment') as RemoteEvent

// craeteEquipmentEvent.FireServer('RocketLauncher')
new CharacterController().Start()
new GameLoader()
    .RegisterGameMode(new TeamWarsGameMode())
    .Startup()
craeteEquipmentEvent.FireServer('AK47')
//14182762219 - EquipAK47