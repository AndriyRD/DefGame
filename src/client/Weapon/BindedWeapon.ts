import { ContextActionService } from "@rbxts/services"
import { EventProvider } from "client/EventProvider"
import { GlobalConfig } from "shared/GlobalConfig"
import { RemoteProvider } from "shared/RemoteProvider"
import { AutoFire } from "shared/Weapon/FireModule/AutoFire"
import { BaseWeapon } from "shared/Weapon/Weapons/BaseWeapon"

export class BindedWeapon{
    private readonly bindData = GlobalConfig.BIND_DATA.Weapon
    private readonly remote = RemoteProvider.GetForWeapon()
    private readonly cameraEvents = EventProvider.CharatcerController.Camera
    private readonly name: string

    Bind(){
        ContextActionService.BindAction(this.bindData.Fire.Action, (name, state) => {
            if (name === this.bindData.Fire.Action){
                if (state === Enum.UserInputState.Begin){
                    this.remote.StartFire.FireServer(this.name)
                    this.autoFireModule.StartFire()
                    this.cameraEvents.Shake.Fire()
                }
                else if (state === Enum.UserInputState.End){
                    this.remote.StopFire.FireServer(this.name)
                    this.autoFireModule.StopFire()
                    this.cameraEvents.StopShake.Fire()
                }
            }
        }, false, this.bindData.Fire.PC.Input)

        ContextActionService.BindAction(this.bindData.Reload.Action, (name, state) => {
            if (name === this.bindData.Reload.Action && state === Enum.UserInputState.Begin){
                this.remote.Reload.FireServer(this.name)
                this.weapon.Reload()
            }
        }, false, this.bindData.Reload.PC.Input)
    }

    Unbind(){
        this.autoFireModule.StopFire()
        this.remote.StopFire.FireServer(this.weapon.DataObject.Name)
        ContextActionService.UnbindAction(this.bindData.Fire.Action)
        ContextActionService.UnbindAction(this.bindData.Reload.Action)
        this.cameraEvents.StopShake.Fire()
    }

    constructor(
        private readonly weapon: BaseWeapon,
        private readonly autoFireModule: AutoFire){
            this.name = weapon.DataObject.Name
        }
}