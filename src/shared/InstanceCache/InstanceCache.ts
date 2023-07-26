import { LIFE_CICLE_MODS } from "shared/Loop/LIFE_CICLE_MODS";
import { LifeCicle } from "../Loop/LifeCicle";
import { TempInstance } from "./TempInstance";
import { IDestroying } from "./IDestroying";

export class InstanceCache<T extends IDestroying>{
    private maxLifeTime = 20
    private readonly lifeCicle = new LifeCicle(LIFE_CICLE_MODS.HEARTBEAT)
    private readonly items = new Map<string, TempInstance<T>>()

    private GetKeyByInstance(inst: T){
        for (const e of this.items)
            if(e[1].GetInstance() === inst)
                return e[0]
    }

    private UpdateItems(dt: number){
        for (const e of this.items) {
            const item = e[1]
            item.Update((v) => v+dt)
            if(item.IsOld())
                this.items.delete(e[0])
        }
    }

    private RemoveWhenDestroying(inst: T){
        let connection = inst.Destroying.Connect(() => {
            const key = this.GetKeyByInstance(inst)
            if(key) this.items.delete(key)
            connection.Disconnect()
        })
    }

    SetMaxLifeTime(lifeTime: number){
        this.maxLifeTime = lifeTime 
        return this
    }

    AddItem(key: string, item: T){
        this.items.set(key, new TempInstance(item, this.maxLifeTime))
        this.RemoveWhenDestroying(item)
        return this
    }

    Take(){
        let res = undefined
        let resLifeTime = 0
        for (const e of this.items) {
            const item = e[1]
            if(!res || res.GetLifeTime() >= resLifeTime) {
                res = item
                resLifeTime = item.GetLifeTime()
            }
        }

        return res?.GetInstance()
    }

    constructor(){
        this.lifeCicle
            .AddTask('main', (dt) => this.UpdateItems(dt))
            .Run()
    }
}