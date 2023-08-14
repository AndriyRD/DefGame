import { RunService } from "@rbxts/services"
import { Reflection } from "shared/Reflection"

export class RemoteInstance {
    protected eventConnectionBuffer = undefined as RBXScriptConnection | undefined
    protected keysOnCallProp = {
        Event: {
            Server: 'OnServerEvent',
            Client: 'OnClientEvent'
        },
        Function: {
            Server: 'OnServerInvoke',
            Client: 'OnClientInvoke'
        }
    }

    protected FindKeyOnCallInstance(){
        if(this.instance.IsA("RemoteEvent"))
            if(RunService.IsClient())
                return this.keysOnCallProp.Event.Client
            else
                return this.keysOnCallProp.Event.Server

        else if(this.instance.IsA("RemoteFunction"))
            if(RunService.IsClient())
                return this.keysOnCallProp.Function.Client
            else
                return this.keysOnCallProp.Function.Server
        error(`Not correct remote-instance: ${this.instance}`)
    }

    Connect(cb: (...params: any) => any){
        const instanceMap = Reflection.ConvertObjectToMap(this.instance)
        if(this.instance.IsA("RemoteEvent")){
            const onEvent = instanceMap.get(this.FindKeyOnCallInstance()) as RBXScriptSignal
            this.eventConnectionBuffer = onEvent.Connect((...args: unknown[]) => cb(...args))
        }
            
        else if(this.instance.IsA("RemoteFunction"))
            instanceMap.set(this.FindKeyOnCallInstance(), cb) 
        print(this.FindKeyOnCallInstance())
    }

    Destroy(){
        this.instance.Destroy()
        table.clear(this)
    }

    constructor(private readonly instance: RemoteFunction | RemoteEvent){
    }
}