import { ReplicatedStorage } from "@rbxts/services"
import { IEventListener } from "server/Core/EventSystem/IEventListener"
import { WeaponServiceAPI } from "./WeaponServiceAPI"

export class WeaponEventListener implements IEventListener{
    private readonly dir: Folder
    EventHandler = new Map<string, Callback>()

    GetId(): string {
        return 'weapon'
    }
    
    GetEventDirecotry(): Folder {
        return this.dir
    }

    OnStartFire(plr: Player, name: string){
        WeaponServiceAPI.StartFire(plr, name)
    }

    OnStopFire(plr: Player, name: string){
        WeaponServiceAPI.StopFire(plr, name)
    }

    constructor(){
        this.dir = ReplicatedStorage.FindFirstChild('Weapon')!.FindFirstChild('Remote') as Folder
        this.EventHandler.set('StartFire', (p, n) => this.OnStartFire(p, n))
        this.EventHandler.set('StopFire', (p, n) => this.OnStopFire(p, n))
    }
}