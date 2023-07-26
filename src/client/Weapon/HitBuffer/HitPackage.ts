import { BaseGameLoop } from "shared/Loop/BaseGameLoop"
import { IHitResult } from "client/Weapon/IHitResult"

export class HitPackage {
    private readonly packageSize: number
    private readonly maxLifeTime: number
    private readonly results = new Array<IHitResult>()
    private readonly tickRate = 1/20
    private readonly lifeHanlder = new BaseGameLoop()
    private readonly resultList = new Array<IHitResult>()
    public readonly OnReady = new Instance('BindableEvent')
    private firstItemLifeTime = 0

    private OnTick(){
        if (this.resultList.size() <= 0) return
        this.firstItemLifeTime += this.tickRate
        if (this.firstItemLifeTime >= this.maxLifeTime) 
        this.OnReady.Fire(this)
    }

    private Init(){
        this.lifeHanlder.AddTask('main', () => this.OnTick())
        this.lifeHanlder.SetTickRate(this.tickRate)
        this.lifeHanlder.StartAsync()
    }

    Reset(){
        this.results.clear()
        this.firstItemLifeTime = 0
    }

    Push(res: IHitResult){
        if(this.resultList.push(res) >= this.packageSize) this.OnReady.Fire(this)
    }

    GetResults(){
        return this.resultList 
    }

    constructor(_packageSize: number | undefined, _maxLifeTime: number | undefined){
        this.maxLifeTime = _maxLifeTime ? _maxLifeTime : 1
        this.packageSize = _packageSize ? _packageSize : 4
        this.Init()
    }
}