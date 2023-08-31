import { RunService } from "@rbxts/services"
import { RemoteProvider } from "shared/RemoteProvider"

export class WeaponOwnerState {
    private readonly remote = RemoteProvider.GetForWeapon()
    private owner: Player | undefined
    ChangeOwnerEvent: BindableEvent<(oldOwner: Player|undefined, newOwner: Player|undefined) => void > = 
        new Instance('BindableEvent')

    private RemoteCallChangeState(event: RemoteEvent){
        if(RunService.IsClient()) event.FireServer(this.owner, this.weaponGlobalId)
        else event.FireAllClients(this.owner, this.weaponGlobalId)
    }

    ChagneOwner(newOwner: Player){
        this.owner = newOwner
        this.RemoteCallChangeState(this.remote.NewWeaponOwner)
        this.ChangeOwnerEvent.Fire(undefined, newOwner)
        return this
    }

    RemoveOwner(){
        this.RemoteCallChangeState(this.remote.DropWeapon)
        this.ChangeOwnerEvent.Fire(this.owner, undefined) 
        this.owner = undefined
        return this
    }

    GetCurrent(){
        return this.owner
    }

    constructor(private readonly weaponGlobalId: number){
    }
}