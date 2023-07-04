import { CreateEquipmentOptionData, EquipmentFactory } from "shared/Equipment/EquipmentFactory";
import { ClientEquipmentRegister } from "./ClientEquipmentRegister";
import { Players, ReplicatedStorage } from "@rbxts/services";
import { BindedHotInventory } from "./Inventory/BindedHotInventory";
import { EquipmentGlobalConfig } from "shared/Equipment/EquipmentGlobalConfig";
const remote = ReplicatedStorage.WaitForChild('Equipment').WaitForChild('Remote') as Folder
const createdEquipmentEvent = remote.WaitForChild('Created') as RemoteEvent

export class ClientEquipmentManager {
    private readonly register = new ClientEquipmentRegister()
    private readonly factory = new EquipmentFactory()
    private readonly hotInventory = new BindedHotInventory(
        Players.LocalPlayer, EquipmentGlobalConfig.HOT_INVENTORY_SIZE)

    Startup(){
        createdEquipmentEvent.OnClientEvent.Connect((name: string, data: CreateEquipmentOptionData) => {
            const equipment = this.factory.Create(Players.LocalPlayer, name, data)
            this.hotInventory.PushItem(this.register.RegsiterItem(equipment))
        })
    }
}