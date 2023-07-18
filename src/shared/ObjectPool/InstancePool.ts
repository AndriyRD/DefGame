import { ObjectPool } from "./ObjectPool";

export class InstancePool extends ObjectPool<Instance>{

    Push(item: Instance): void {
        super.Push(item)
        let conn = item.Destroying.Connect(() => {
            const obj = this.items.forEach((v, i) => {
                if(v.GetItem() === item){
                    this.items.remove(i)
                    print(`Remove from pool item: ${item}`)
                }
            })
        })
    }

    constructor(objectLifeTime: number, tickRate: number | undefined){
        super(objectLifeTime, tickRate)
    }
}