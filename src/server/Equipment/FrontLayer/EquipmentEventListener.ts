import { ReplicatedStorage } from "@rbxts/services";
import { IEventListener } from "server/Core/EventSystem/IEventListener";
import EquipmentApi from "./EquipmnetAPI";
import { CreateEquipmentOptionData } from "shared/Equipment/EquipmentFactory";
const remote = ReplicatedStorage.WaitForChild('Equipment').WaitForChild('Remote') as Folder
const createdEquipmentEvent = remote.WaitForChild('Created') as RemoteEvent

export class EquipmentEventListener implements IEventListener{
    private readonly equipmentServiceAPI = EquipmentApi.Import()
    private readonly dir = 
        ReplicatedStorage.FindFirstChild('Equipment')!.FindFirstChild('Remote') as Folder
    EventHandler = new Map<string, Callback>()

    GetId(): string {
        return 'equipment';
    }

    GetEventDirecotry(): Folder {
        return this.dir;
    }

    OnCreateEquipment(player: Player, name: string){
        const data = this.equipmentServiceAPI.Create(player, name) as Array<unknown>
        const createEquipmentData = {
            Model: data[0],
            Grip: data[1]
        } as CreateEquipmentOptionData
        createdEquipmentEvent.FireClient(player, name, createEquipmentData)
    }

    OnSelectEquipment(player: Player, name: string){
        this.equipmentServiceAPI.SelectEquipment(player, name)
    }
    
    constructor(){
        this.EventHandler.set('CreateEquipment', (p, name) => this.OnCreateEquipment(p, name))
        this.EventHandler.set('SelectEquipment', (p, name) => this.OnSelectEquipment(p, name))
    }
}