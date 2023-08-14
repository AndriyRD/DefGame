import { IHitResult } from "shared/Weapon/IHitResult"
import { LifeCicle } from "shared/Loop/LifeCicle"

export class HitPackage {
    private readonly packageSize: number
    private readonly maxLifeTime: number
    private readonly results = new Array<IHitResult>()
    private readonly lifeHanlder = new LifeCicle()
    public readonly OnReady = new Instance('BindableEvent')
    private firstItemLifeTime = 0

    private Send(){
        this.OnReady.Fire()
        this.results.clear()
        this.firstItemLifeTime = 0
    }

    private OnTick(dt: number){
        if (this.results.size() <= 0) return
        this.firstItemLifeTime += dt
        if (this.firstItemLifeTime >= this.maxLifeTime)
            this.Send()
    }

    private Init(){
        this.lifeHanlder.AddTask('main', (dt) => this.OnTick(dt))
        this.lifeHanlder.Run()
    }

    Reset(){
        this.results.clear()
        this.firstItemLifeTime = 0
    }

    Push(res: IHitResult){
        if(this.results.push(res) >= this.packageSize) this.Send()
    }

    GetResults(){
        return this.results 
    }

    constructor(_packageSize: number | undefined, _maxLifeTime: number | undefined){
        this.maxLifeTime = _maxLifeTime ? _maxLifeTime : 1
        this.packageSize = _packageSize ? _packageSize : 4
        this.Init()
    }
}