import { BaseGameLoop } from "shared/BaseGameLoop";

export class Stamina {
    private readonly loopHandler = new BaseGameLoop()
    private currentValue = 0
    private enableRegenState = true

    private RegenStamina(){
        if (this.currentValue < this.maxValue){
            this.currentValue++
            if(this.currentValue > this.maxValue) 
                this.currentValue = this.maxValue
        }
    }

    private ConsuptionStamina(){
        if (this.currentValue > 0){
            this.currentValue--
            if(this.currentValue < 0) 
                this.currentValue = 0
        }
    }

    Dispose(){
        this.loopHandler.Stop()
        this.loopHandler.ClearTaskList()
        this.currentValue = undefined as any
        this.maxValue = undefined as any
        (this.loopHandler as any) = undefined as any
    }

    GetCurrentValue(){
        return this
    }

    SetConsuptionMode(value: boolean){
        this.enableRegenState = value
    }

    constructor(private maxValue: number, private regenSpeed: number){
        this.loopHandler
            .AddTask('main', () => {
                if(this.enableRegenState)
                    this.RegenStamina()
                else
                    this.ConsuptionStamina()
            }).StartAsync()
    }
}