import { BaseGameLoop } from "shared/BaseGameLoop";
import { TempItem } from "./TempItem";

export class ObjectPool<T>{
    private readonly tickRate
    protected readonly lifeTimeHandler;
    protected readonly items = new Array<TempItem<T>>()

    protected CanTake(item: TempItem<T>){
        return true
    }

    protected ResetLifeTime(oldLifeTime: number){
        return 0
    }

    protected UpdateItemsLifeTime(){
        for (const item of this.items)
            item.Update((old) => old + this.tickRate)
    }

    Push(item: T){
        this.items.push(new TempItem(item, this.objectLifeTime))
    }

    Take(){
        let res = this.items[0]
        let resTime = res.GetLifeTime()

        for (const item of this.items) {
            if(this.CanTake(item))
                if(item.GetLifeTime() > resTime){
                    res = item
                    resTime = item.GetLifeTime()
                }
        }
        res.Update((v) => this.ResetLifeTime(v))
        return res
    }

    GetFreeItems(){
        return this.items.map((v) => this.CanTake(v))
    }

    constructor(protected readonly objectLifeTime: number, tickRate: number | undefined){
        this.tickRate = tickRate ? tickRate : 1/20
        this.lifeTimeHandler = new BaseGameLoop()
            .SetTickRate(this.tickRate)
            .AddTask('main', () => this.UpdateItemsLifeTime())
    }
}