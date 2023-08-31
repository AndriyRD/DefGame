import { Workspace } from "@rbxts/services"
import { GlobalConfig } from "./GlobalConfig"

export class IdentifiedInstance<T extends Instance>{
    protected readonly idValueInstance: NumberValue
    private readonly id: number

    GetId = () => this.id
    GetInstance = () => this.instance

    static FindById<T extends Instance>(globalID: number){
        for (const item of Workspace.GetDescendants()) {
            const idValInst = item.FindFirstChild(GlobalConfig.GLOBAL_ID_INSTANCE_NAME)
            if(idValInst && idValInst.IsA("NumberValue") && idValInst.Value === globalID)
                return item as T
        }
    }

    static FindAndWrap<T extends Instance>(globalID: number){
        const inst = this.FindById<T>(globalID)!
        const wrappedInst = new IdentifiedInstance(inst);
        (wrappedInst as any).id = globalID 
        return wrappedInst
    }

    static ParseFrom<T extends Instance>(model: T){
        const idValInstance = model.FindFirstChild(GlobalConfig.GLOBAL_ID_INSTANCE_NAME) as NumberValue
        const wrappedInstance = new IdentifiedInstance<T>(model);
        (wrappedInstance as any).id = idValInstance.Value 
        return wrappedInstance
    }

    constructor(protected readonly instance: T){
        const currentIdInstance = instance.FindFirstChild(GlobalConfig.GLOBAL_ID_INSTANCE_NAME)
        if(currentIdInstance && currentIdInstance.IsA('NumberValue')){
            this.id = currentIdInstance.Value
            this.idValueInstance = currentIdInstance
        }
        else{
            this.id = tick()
            this.idValueInstance = new Instance('NumberValue')
            this.idValueInstance.Value = this.id
            this.idValueInstance.Parent = instance
            this.idValueInstance.Name = GlobalConfig.GLOBAL_ID_INSTANCE_NAME
        }
    }
}