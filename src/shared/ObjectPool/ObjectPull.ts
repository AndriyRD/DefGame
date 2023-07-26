import { BaseGameLoop } from "shared/Loop/BaseGameLoop";
import { TempItem } from "./TempItem";
import { RunService } from "@rbxts/services";

export class ObjectPull<T>{
    private readonly connectino: RBXScriptConnection
    protected readonly items = new Array<TempItem<T>>()

    protected CanTake(item: TempItem<T>){
        return true
    }

    protected ResetLifeTime(oldLifeTime: number){
        return 0
    }

    protected UpdateItemsLifeTime(delata: number){
        for (const item of this.items){
            item.Update((old) => old + delata)
            if(item.GetLifeTime() >= this.objectLifeTime){
                this.OnMaxLifeTime(item)
            }
        }
    }

    protected OnMaxLifeTime(item: TempItem<T>){
        item.Dispose()
    }

    protected FindOldItem(){
        let res = this.items[0]
        let resTime = res.GetLifeTime()

        for (const item of this.items) {
            if(this.CanTake(item))
                if(item.GetLifeTime() > resTime){
                    res = item
                    resTime = item.GetLifeTime()
                }
        }
        return res
    }

    Push(item: T){
        this.items.push(new TempItem(item, this.objectLifeTime))
    }

    Take(){
        const res = this.FindOldItem()
        res.Update((v) => this.ResetLifeTime(v))
        return res
    }

    GetFreeItems(){
        return this.items.filter((v) => this.CanTake(v))
    }

    GetSize(){
        return this.items.size()
    }

    constructor(protected readonly objectLifeTime: number){
        this.connectino = RunService.Heartbeat.Connect((deltaTime) => {
            this.UpdateItemsLifeTime(deltaTime)
        })
    }
}