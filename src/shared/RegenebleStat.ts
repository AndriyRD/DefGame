import { RunService } from "@rbxts/services"

export class RegenebleStat {
    protected canNegetiveValue = true
    protected connection: RBXScriptConnection|undefined
    protected currentValue = 0
    readonly Updated = new Instance('BindableEvent')

    EnableRegen(){
        if(this.connection) this.DisableRegen()
        this.connection = RunService.Heartbeat.Connect((dt) => 
            this.currentValue += math.clamp(this.currentValue+dt, 0, this.maxValue))
        return this
    }

    RegenPause(pauseTime: number){
        if(this.connection && this.connection.Connected){
            coroutine.wrap(() => {
                this.DisableRegen()
                task.wait(pauseTime)
                this.EnableRegen()
            })()
        }
            
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