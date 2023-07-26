import { IDestroying } from "./IDestroying"

export class TempInstance<T extends IDestroying>{
    private lifeTime = 0
    
    Update(update: (oldValue: number) => number){
        this.lifeTime = update(this.lifeTime)
        return this
    }

    ResetLifeTime(){
        this.lifeTime = 0
        return this
    }

    IsOld(){
        return this.lifeTime >= this.maxLifeTime
    }

    GetInstance(){
        return this.instance
    }

    GetLifeTime(){
        return this.lifeTime
    }

    constructor(private readonly instance: T, private maxLifeTime: number){}
}