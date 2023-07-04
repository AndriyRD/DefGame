import { RunService } from "@rbxts/services";
import { ICell } from "./ICell";
import { Inventory } from "./Inventory";

export class HotInventory extends Inventory {
    private CurrentCell: ICell | undefined

    SelectItem(index: number){
        if (this.CurrentCell){
            this.CurrentCell.Equipment.Unequip()
            if (this.CurrentCell.Index === index)
                return this.CurrentCell = undefined
        }
        else {
            this.CurrentCell = this.GetByIndex(index)
            this.CurrentCell.Equipment.Equip()
        }
    }

    SelectByKey(key: string){
        const cell = this.cells.get(key)
        if (cell){
            this.SelectItem(cell.Index)
        } else error(`Not found inventory-item: ${key}`)
    }
}