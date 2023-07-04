import { SinglePlayerStorage } from "server/Core/PlayerStorage/SinglePlayerStorage";
import { EquipmentRegister } from "shared/Equipment/Inventory/EquipmentRegister";
import { PlayerInventory } from "shared/Equipment/Inventory/PlayerInventory";

export class EquipmentInventoryStorage extends SinglePlayerStorage<PlayerInventory> {
    protected CreateItem(plr: Player): PlayerInventory {
        return new PlayerInventory(plr)
    }
    
    Unload(): void {
        //TODO: Unload player inventory
        warn(`Unload inventory for player`)
    }
}