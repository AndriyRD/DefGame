import { EquipmentGlobalConfig } from "../EquipmentGlobalConfig";
import { HotInventory } from "./HotInventory";
import { IEquipmentRegister } from "./IEquipmentRegister";
import { Inventory } from "./Inventory";

export class PlayerInventory {
    private readonly hotInventory: HotInventory;
    // private  readonly bodyInventory: Inventory

    GetHotInventory(){
        return this.hotInventory
    }

    constructor(protected readonly owner: Player){
        this.hotInventory = new HotInventory(
            owner, EquipmentGlobalConfig.HOT_INVENTORY_SIZE);
    }
}