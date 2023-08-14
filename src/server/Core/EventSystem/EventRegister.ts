import { ReplicatedStorage } from "@rbxts/services";
import { IEventListener } from "./IEventListener";
import { EventHandlerParser } from "./EventHandlerParser";
import { RemoteInstance } from "./RemoteInstance";

export class EventRegister {
    private readonly listeners = new Array<IEventListener>()
    private readonly mainDirectoryContainer = ReplicatedStorage
    private readonly eventHandlerParser = new EventHandlerParser()
    private readonly remoteInstancesDirectoryName = 'Remote'

    private FindOrCreateRemoteInstanceDirectory(id: string){
        let dir = this.mainDirectoryContainer.FindFirstChild(id) as Folder
        if(!dir || !dir.IsA("Folder")){
            warn(`Not found remote-storage directory for: ${id}`)
            dir = new Instance('Folder')
            dir.Name = id
            dir.Parent = this.mainDirectoryContainer
        }
        let remoteInstancesDir = dir.FindFirstChild(this.remoteInstancesDirectoryName)
        if (!remoteInstancesDir){
            warn(`Not found ${this.remoteInstancesDirectoryName} directory in: ${id}`)
            remoteInstancesDir = new Instance('Folder')
            remoteInstancesDir.Parent = dir
            remoteInstancesDir.Name = this.remoteInstancesDirectoryName
        }
        return remoteInstancesDir as Folder
    }

    private FindOrCreateEventInstance(name: string, dir: Folder): RemoteEvent{
        let inst = dir.FindFirstChild(name)
        if (!inst){
            inst = new Instance("RemoteEvent")
            inst.Name = name
            inst.Parent = dir
        }
        return inst as any
    }

    Register(listener: IEventListener){
        const dir = this.FindOrCreateRemoteInstanceDirectory(listener.GetId())
        for (const item of this.eventHandlerParser.Parse(listener)) {
            const inst = this.FindOrCreateEventInstance(item.Name, dir)
            new RemoteInstance(inst).Connect(item.Handle)
        }
        this.listeners.push(listener)
        return this
    }
}