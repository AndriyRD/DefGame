import { ReplicatedFirst, RunService } from "@rbxts/services"
import { LIFE_CICLE_MODS } from "./LIFE_CICLE_MODS"
import { Reflection } from "shared/Reflection"

export class LifeCicle {
    private readonly taskList = new Map<string, (deltaTime: number) => void>()
    private readonly mode: LIFE_CICLE_MODS
    private connection = undefined as RBXScriptConnection | undefined
    private running = false

    private GetModeConnection(mode: LIFE_CICLE_MODS){
        return Reflection.ConvertObjectToMap(RunService).get(mode) as RBXScriptSignal
    }

    private OnUpdate(dt: number){
        for (const item of this.taskList)
            item[1](dt)
    }

    Run(){
        if (this.running) return this
        this.running = true
        this.connection = this.GetModeConnection(this.mode).Connect((dt) => this.OnUpdate(dt))
        return this
    }

    Stop(){
        if(!this.running) return this
        this.running = false
        this.connection?.Disconnect()
        return this
    }

    AddTask(key: string, _task: (deltaTime: number) => void){
        this.taskList.set(key, _task)
        return this
    }

    RemoveTask(key: string){
        if (!this.taskList.get(key)) error(`Not found task by key: ${key}`)
        this.taskList.delete(key)
        return this
    }

    ClearTaskList(){
        this.taskList.clear()
        return this
    }

    constructor(mode: LIFE_CICLE_MODS | undefined){
        this.mode = mode ? mode : LIFE_CICLE_MODS.HEARTBEAT
    }
}