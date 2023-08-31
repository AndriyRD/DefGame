import { EventProvider } from "client/EventProvider"
import { GlobalConfig } from "shared/GlobalConfig"
import { RemoteProvider } from "shared/RemoteProvider"
import { IWeapon } from "shared/Weapon/IWeapon"

export abstract class BindedWeapon<T extends IWeapon>{
    protected readonly bindData = GlobalConfig.BIND_DATA.Weapon
    protected readonly remote = RemoteProvider.GetForWeapon()
    protected readonly cameraEvents = EventProvider.CharatcerController.Camera
    protected readonly name: string

    abstract Bind(): void
    abstract Unbind(): void

    constructor(protected readonly weapon: T){
        this.name = weapon.GetId()
    }
}