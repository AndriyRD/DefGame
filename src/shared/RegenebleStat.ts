import { RunService } from "@rbxts/services"

export class RegenebleStat {
    protected canNegetiveValue = true
    protected connection: RBXScriptConnection|undefined
    protected regemSpeed = 10
    protected currentValue = 0
    protected paused = false
    protected pauseTimer = 0
    protected readonly usePause = new Instance('BindableEvent')
    readonly Updated = new Instance('BindableEvent')

    protected SetPauseRegen(pauseTime: number){
        if(this.paused) return this.usePause.Fire(pauseTime)

        this.paused = true
        this.pauseTimer = 0

        let connection = RunService.Heartbeat.Connect((dt) => {
            this.pauseTimer += dt
            if(this.pauseTimer >= pauseTime){
                this.paused = false
                connection.Disconnect()
                connection = undefined as any
                this.EnableRegen()
            }
        })

        this.usePause.Event.Connect((newPauseTime) => {
            this.pauseTimer = 0
            pauseTime = newPauseTime
        })
    }

    EnableRegen(){
        if(this.connection) this.DisableRegen()
        this.connection = RunService.Heartbeat.Connect((dt) => {
            if(this.currentValue < this.maxValue){  
                this.currentValue += dt*this.regemSpeed
                if(this.currentValue > this.maxValue) this.currentValue = this.maxValue
                this.Updated.Fire(this.currentValue)
            }
        })
        return this
    }

    RegenPause(pauseTime: number){
        this.DisableRegen()
        this.SetPauseRegen(pauseTime)
        return this
    }

    DisableRegen(){
        this.connection?.Disconnect()
        this.connection = undefined
        return this
    }

    GetValue(){
        return this.currentValue
    }

    SetRegenSpeed(value: number){
        this.regemSpeed = value
        return this
    }

    Update(update: (oldValue: number) => number){
        this.currentValue = update(this.currentValue)
        if(this.canNegetiveValue)
            this.currentValue = math.clamp(this.currentValue, 0, this.maxValue)
        return this
    }

    Dispose(){
        this.DisableRegen()
        this.Updated.Destroy()
        table.clear(this)
    }

    SetCanNegetiveValue(value: boolean){
        this.canNegetiveValue = value
        return this
    }

    constructor(protected maxValue: number){
        this.currentValue = maxValue
    }
}