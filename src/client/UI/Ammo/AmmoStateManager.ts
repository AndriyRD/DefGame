import { Reflection } from "shared/Reflection"
import { AmmoContainer } from "shared/Weapon/Ammo/AmmoContainer"
import { IAmmoContainerState } from "shared/Weapon/Ammo/IAmmoContainerState"

export class AmmoStateManager {
    private ammoContainer: AmmoContainer | undefined
    private connections = {
        ChangeMag: undefined as RBXScriptConnection | undefined,
        ChangeAmmo: undefined as RBXScriptConnection | undefined 
    }
    readonly Changed = new Instance('BindableEvent')

    private OnUpdate(state: IAmmoContainerState){
        this.Changed.Fire(state)
    }

    Clear(){
        for (const conn of Reflection.ConvertObjectToMap<RBXScriptConnection>(this.connections)) {
            conn[1].Disconnect()
            conn[1] = undefined as any
        }
    }

    SetAmmoContainer(ammoContainer: AmmoContainer){
        if(this.ammoContainer) this.Clear()
        this.ammoContainer = ammoContainer
        this.connections.ChangeAmmo = this.ammoContainer.Events.ChangeAmmo.Event.Connect((state) => this.OnUpdate(state))
        this.connections.ChangeMag = this.ammoContainer.Events.ChangeMagazine.Event.Connect((state) => this.OnUpdate(state))
        return this
    }
}