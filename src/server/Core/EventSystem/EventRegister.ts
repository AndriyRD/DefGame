import { IEventListener } from "./IEventListener";

export class EventRegister {
    private readonly listeners = new Array<IEventListener>()

    Register(listener: IEventListener){
        listener.EventHandler.forEach((handler, key) => {
            const eventInst = listener.GetEventDirecotry().FindFirstChild(key) as RemoteEvent
            if (eventInst){
                eventInst.OnServerEvent.Connect(handler)
                print(`Add new event handler: ${key}`)
            }
            else 
                warn(`Not found event for listener: ${listener.GetId()} (event: ${key})`)
        })

        this.listeners.push(listener)
        print(`Registered new event-listener ${listener.GetId()}`)
        return this
    }
}