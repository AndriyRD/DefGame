import { ContextActionService } from "@rbxts/services"
import { IAutoFiredWeapon } from "shared/Weapon/IAutoFiredWeapon"
import { BindedWeapon } from "./BindedWeapon"

export class AutoFiredBindedWeapon extends BindedWeapon<IAutoFiredWeapon> {
    Bind(){
        ContextActionService.BindAction(this.bindData.Fire.Action, (name, state) => {
            if (name === this.bindData.Fire.Action){
                if (state === Enum.UserInputState.Begin){
                    this.remote.StartFire.FireServer(this.name)
                    this.weapon.StartFire()
                    this.cameraEvents.Shake.Fire()
                }
                else if (state === Enum.UserInputState.End){
                    this.remote.StopFire.FireServer(this.name)
                    this.weapon.StopFire()
                    this.cameraEvents.StopShake.Fire()
                }
            }
        }, false, this.bindData.Fire.PC.Input)
    }

    Unbind(){
        this.weapon.StopFire()
        this.remote.StopFire.FireServer(this.name)
        ContextActionService.UnbindAction(this.bindData.Fire.Action)
        this.cameraEvents.StopShake.Fire()
    }
}