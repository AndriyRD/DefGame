import { Players, ReplicatedStorage } from "@rbxts/services";
import { ClientEquipmentManager } from "./Equipment/ClientEquipmentManager";
import { WeaponProvider } from "./Weapon/WeaponProvider";
import { WeaponReplicator } from "./Weapon/ReplicateWeapon/WeaponFireReplicator";
import App from "./UI/App";
import { Runner } from "./Runner/ClientRunner";
const remote = ReplicatedStorage.WaitForChild('Equipment').WaitForChild('Remote') as Folder
const craeteEquipmentEvent = remote.WaitForChild('CreateEquipment') as RemoteEvent

new WeaponProvider()
new WeaponReplicator().Run()
new ClientEquipmentManager().Startup()
new Runner(Players.LocalPlayer, '845386501').Bind()
App()

craeteEquipmentEvent.FireServer('AK47')
// craeteEquipmentEvent.FireServer('RocketLauncher')