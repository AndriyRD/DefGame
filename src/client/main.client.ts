import { Players, ReplicatedStorage } from "@rbxts/services";
import { GameLoader } from "./GameLoader/ClientGameLoader";
import { TeamWarsGameMode } from "./GameLoader/Mods/TeamWars/TeamWarsGameMode";
import { CharacterController } from "./CharacterController/CharacterController";
import { CHARACTER_LOAD_EVENT_NAMES, ReloadableCharacter } from "shared/Character/ReloadableCharacter";
const remote = ReplicatedStorage.WaitForChild('Equipment').WaitForChild('Remote') as Folder
const craeteEquipmentEvent = remote.WaitForChild('CreateEquipment') as RemoteEvent

CharacterController.Startup()
CharacterController.SwithModuleState("TOP_DOWN_CAMERA", true)
CharacterController.SwithModuleState("CHARACTER_ROTATE", true)

new GameLoader()
    .RegisterGameMode(new TeamWarsGameMode())
    .Startup()

craeteEquipmentEvent.FireServer('AK47')

new ReloadableCharacter(Players.LocalPlayer).Events.get(CHARACTER_LOAD_EVENT_NAMES.CHARACTER)?.Event.Connect(()=>{
    craeteEquipmentEvent.FireServer('AK47')
})