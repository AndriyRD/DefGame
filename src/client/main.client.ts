import { ReplicatedStorage } from "@rbxts/services";
import { ClientEquipmentManager } from "./Equipment/ClientEquipmentManager";
import { WeaponProvider } from "./Weapon/WeaponProvider";
import { WeaponReplicator } from "./Weapon/ReplicateWeapon/WeaponFireReplicator";
const remote = ReplicatedStorage.WaitForChild('Equipment').WaitForChild('Remote') as Folder
const craeteEquipmentEvent = remote.WaitForChild('CreateEquipment') as RemoteEvent

new WeaponProvider()
new WeaponReplicator().Run()
new ClientEquipmentManager().Startup()

craeteEquipmentEvent.FireServer('AK47')