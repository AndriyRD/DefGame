type IEventHandler = Map<string, Callback>

export interface IEventListener {
    GetId(): string
    GetEventDirecotry(): Folder
    readonly EventHandler: Map<string, Callback>
}