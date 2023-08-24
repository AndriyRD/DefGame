import { ReplicatedStorage } from "@rbxts/services";
import { IEventListener } from "server/Core/EventSystem/IEventListener";
import EquipmentApi from "./EquipmnetAPI";
import { CreateEquipmentOptionData } from "shared/Equipment/EquipmentFactory";
const remote = ReplicatedStorage.WaitForChild('Equipment').WaitForChild('Remote') as Folder
const createdEquipmentEvent = remote.WaitForChild('Created') as RemoteEvent

export class EquipmentEventListener implements IEventListener{
    private readonly equipmentServiceAPI = EquipmentApi.Import()

    GetId(): string {
        return 'Equipment';
    }

    OnCreateEquipment = (player: Player, name: string) => {
        const data = this.equipmentServiceAPI.Create(player, name) as Array<unknown>
        const createEquipmentData = {
            Model: data[0],
            Grip: data[1]
        } as CreateEquipmentOptionData
        createdEquipmentEvent.FireClient(player, name, createEquipmentData)
    }

    OnSelectEquipment = (player: Player, name: string) => {
        this.equipmentServiceAPI.SelectEquipment(player, name)
    }
}