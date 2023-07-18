import { BaseGameLoop } from "shared/BaseGameLoop";

export class Stamina {
    private readonly loopHandler = new BaseGameLoop()
    private currentValue = 0
    private enableRegenState = true
    readonly OnEndStamina = new Instance('BindableEvent')
    readonly OnUpdateValue = new Instance('BindableEvent')

    private RegenStamina(){
        if (this.currentValue < this.maxValue){
            this.currentValue++
            if(this.currentValue > this.maxValue) 
                this.currentValue = this.maxValue
            this.OnUpdateValue.Fire(this.currentValue)
        }
    }

    private ConsuptionStamina(){
        if (this.currentValue > 0){
            this.currentValue--
            this.OnUpdateValue.Fire(this.currentValue)
        }
        if(this.currentValue <= 0){
            if (this.currentValue < 0) this.currentValue = 0
            this.OnEndStamina.Fire()
        }
    }

    Dispose(){
        this.loopHandler.Stop()
        this.OnEndStamina.Destroy()
        this.OnUpdateValue.Destroy()
        this.loopHandler.ClearTaskList()
        this.currentValue = undefined as any
        this.maxValue = undefined as any
        (this.loopHandler as any) = undefined;
        (this.OnEndStamina as any) = undefined;
        (this.OnEndStamina as any) = undefined
    }

    GetCurrentValue(){
        return this.currentValue
    }

    GetMaxValue(){
        return this.maxValue
    }

    SetConsuptionMode(value: boolean){
        this.enableRegenState = !value
    }

    constructor(private maxValue: number, private regenSpeed: number){
        this.loopHandler
            .AddTask('main', () => {
                if(this.enableRegenState)
                    this.RegenStamina()
                else
                    this.ConsuptionStamina()
            }).StartAsync().SetTickRate(1/20)
        this.currentValue = this.maxValue
    }
}