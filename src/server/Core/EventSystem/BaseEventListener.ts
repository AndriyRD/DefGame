import { ReplicatedStorage } from "@rbxts/services";
import { IEventListener } from "./IEventListener";

export abstract class BaseEventListener implements IEventListener {
    protected remoteFolerName = 'Remote'
    protected readonly dir
    readonly EventHandler = new Map<string, Callback>();
    abstract GetId(): string

    GetEventDirecotry(): Folder {
        return this.dir
    }

    constructor(){
        this.dir = ReplicatedStorage.WaitForChild(
            this.GetId()).WaitForChild(this.remoteFolerName) as Folder
    }
}