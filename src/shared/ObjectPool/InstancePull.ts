import { ObjectPull } from "./ObjectPull";
import { TempItem } from "./TempItem";

export class InstancePull extends ObjectPull<Instance>{

    protected OnMaxLifeTime(item: TempItem<Instance>): void {
        item.GetItem().Destroy()
    }

    Push(item: Instance): void {
        super.Push(item)
        let conn = item.Destroying.Connect(() => {
            const obj = this.items.forEach((v, i) => {
                if(v.GetItem() === item){
                    this.items.remove(i)
                    print(`Remove from pool item: ${item}`)
                }
            })
            conn.Disconnect()
            conn = undefined as any
        })
    }

    constructor(objectLifeTime: number, tickRate: number | undefined){
        super(objectLifeTime, tickRate)
        math.randomseed(tick())
    }
}