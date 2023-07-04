import { IWrappedEquipment } from "../IWrappedEquipment";
import { ICell } from "./ICell";

export class Inventory {
    protected readonly cells = new Map<string, ICell>()

    protected CanPushItem(){
        return (this.cells.size() < this.size)
    }

    protected GetNewItemIndex(){
        return this.cells.size()
    }

    PushItem(equipment: IWrappedEquipment){
        if (this.CanPushItem()){
            this.cells.set(equipment.GetID(), 
            {
                Equipment: equipment,
                Index: this.GetNewItemIndex()
            })
        }
        return equipment
    }

    RemoveItem(key: string){
        const cell = this.cells.get(key)
        if (cell){
            this.cells.delete(key)
        } 
        else error(`Not found registered item ${key} in 
            inventory of player: ${tostring(this.owner)}`)
        return this
    }

    TryGetByIndex(index: number){
        for (const e of this.cells) {
            const cell = e[1]
            if (cell.Index === index) return cell
        }
    }

    GetByIndex(index: number){
        if (index > this.size) 
            error(`The index is too large. Indetory: ${tostring(this.owner)}`)
        const res = this.TryGetByIndex(index)
        if (!res)
            error(`Not found inventory cell by index: ${index}`)
        return res
    }

    Swap(indexA: number, IndexB: number){
        //TODO: Add swap
    }

    constructor(
        protected readonly owner: Player,
        protected readonly size: number,
    ){}
}