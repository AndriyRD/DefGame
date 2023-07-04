export class BaseGameLoop {
    private enabled = false
    private tickRate = 1
    private readonly taskList = new Map<string, (param: any) => void>()
    private readonly dataObject = {}

    StartAsync(){
        this.enabled = true
        coroutine.wrap(() => {
            while (this.enabled){
                const start = time()

                for (const _task of this.taskList) {
                    _task[1](this.dataObject)
                }
                const theta = time() - start
                if (theta < this.tickRate){
                    task.wait(this.tickRate - theta)
                }
            }
        })()
        return this
    }

    AddTask(name: string, _task: (param: any) => void){
        this.taskList.set(name, _task)
        return this
    }

    Stop(){
        this.enabled = false
        return this
    }

    SetTickRate(tickRate: number){
        this.tickRate = tickRate
        return this
    }
}