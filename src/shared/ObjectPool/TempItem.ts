export class TempItem<T>{
    private lifeTime = 0
    public readonly OnUpdate = new Instance('BindableEvent')

    Update(updateLigeTime: (oldValue: number) => number){
        this.lifeTime = updateLigeTime(this.lifeTime)
        this.OnUpdate.Fire(this.lifeTime)
    }

    IsOld(){
        return this.lifeTime >= this.maxLifeTime
    }

    GetItem(){
        return this.item
    }

    GetLifeTime(){
        return this.lifeTime
    }

    Dispose(){
        if(typeOf(this.item) === "Instance")
            (this.item as Instance).Destroy();
        else if(typeOf(this.item) === "table")
            table.clear(this.item as {});
        (this.item as any) = undefined;
        this.lifeTime = undefined as any;
        (this.maxLifeTime as any) = undefined;
        (this.OnUpdate as any) = undefined;
    }

    constructor(private readonly item: T, private readonly maxLifeTime: number){
    }
}