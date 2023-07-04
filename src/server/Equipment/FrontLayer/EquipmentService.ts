import { IApiService } from "server/Core/ApiService/IApiService";
import { EquipmentFactory } from "shared/Equipment/EquipmentFactory";
import { EquipmentInventoryStorage } from "../EquipmentInventoryStorage";
import { ServerEquipmentRegister } from "../ServerEquipmentRegister";

export class EquipmentService implements IApiService {
    private readonly factory = new EquipmentFactory()
    private readonly equipmentRegister = new ServerEquipmentRegister()
    private readonly storage = new EquipmentInventoryStorage()
    ServiceHandlers = new Map<string, Callback>()
    
    GetId(): string {
        return 'Equipment'
    }

    AddEquipment(plr: Player, name: string){
        const equipment = this.storage
            .GetOrCreate(plr)
            .GetHotInventory()
            .PushItem(
                this.equipmentRegister.RegsiterItem(
                    this.factory.Create(plr, name, undefined)))
        return [equipment.GetModel(), equipment.GetGrip()]
    }

    SelectEquipment(plr: Player, name: string){
        this.storage.Get(plr)!.GetHotInventory().SelectByKey(name)
    }
    
    constructor(){
        this.ServiceHandlers.set('CreateEquipment', (plr, name) => this.AddEquipment(plr, name))
        this.ServiceHandlers.set('SelectEquipment', (plr, name) => this.SelectEquipment(plr, name))
    }
}