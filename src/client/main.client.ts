import { ReplicatedStorage } from "@rbxts/services";
import { GameLoader } from "./GameLoader/ClientGameLoader";
const remote = ReplicatedStorage.WaitForChild('Equipment').WaitForChild('Remote') as Folder
const craeteEquipmentEvent = remote.WaitForChild('CreateEquipment') as RemoteEvent

// craeteEquipmentEvent.FireServer('RocketLauncher')

new GameLoader().Startup()
craeteEquipmentEvent.FireServer('AK47')