import { ReplicatedStorage } from "@rbxts/services";
import { IEventListener } from "server/Core/EventSystem/IEventListener";

export class BuildingEventListener implements IEventListener {
    private readonly dir: Folder 
    EventHandler = new Map<string, Callback>()

    GetId(): string {
        return 'build';
    }
    GetEventDirecotry() {
        return this.dir
    }

    OnBuild(plr: Player, id: string, cf: CFrame){
        print(`Player: ${plr} wanna build: ${id}`)
    }

    constructor(){
        this.dir = ReplicatedStorage.WaitForChild('Build').WaitForChild('Remote') as Folder
        this.EventHandler.set('Build', (p, id, cf) => this.OnBuild(p,id,cf))
    }

}