import { Players, ReplicatedStorage } from "@rbxts/services";
import { GameLoader } from "./GameLoader/ClientGameLoader";
import { TeamWarsGameMode } from "./GameLoader/Mods/TeamWars/TeamWarsGameMode";
import { CharacterController } from "./CharacterController/CharacterController";
import { ASSET_INSTANCES, AssetInstance } from "shared/AssetInstance/AssetInstance";
import { CHARACTER_LOAD_EVENT_NAMES, ReloadableCharacter } from "shared/Character/ReloadableCharacter";
const remote = ReplicatedStorage.WaitForChild('Equipment').WaitForChild('Remote') as Folder
const craeteEquipmentEvent = remote.WaitForChild('CreateEquipment') as RemoteEvent

// craeteEquipmentEvent.FireServer('RocketLauncher')
new CharacterController().Start()
new GameLoader()
    .RegisterGameMode(new TeamWarsGameMode())
    .Startup()
task.wait(5)
print('Call create weapon')
craeteEquipmentEvent.FireServer('AK47')

new ReloadableCharacter(Players.LocalPlayer).Events.get(CHARACTER_LOAD_EVENT_NAMES.CHARACTER)?.Event.Connect(()=>{
    craeteEquipmentEvent.FireServer('AK47')
})