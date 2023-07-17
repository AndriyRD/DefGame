import { ContextActionService } from "@rbxts/services"
import { GlobalConfig } from "shared/GlobalConfig"
import { RemoteProvider } from "shared/RemoteProvider"
import { AutoFireModule } from "shared/Weapon/AutoFireModule"
import { IWeapon } from "shared/Weapon/IWeapon"

export class WeaponBindModule {
    private readonly bindData = GlobalConfig.BIND_DATA.Weapon
    private readonly remote = RemoteProvider.GetForWeapon()

    Bind(){
        ContextActionService.BindAction(this.bindData.Fire.Action, (name, state) => {
            if (name === this.bindData.Fire.Action){
                if (state === Enum.UserInputState.Begin){
                    this.remote.StartFire.FireServer(this.weapon.GetName())
                    this.autoFireModule.StartFire()
                }
                else if (state === Enum.UserInputState.End){
                    this.remote.StopFire.FireServer(this.weapon.GetName())
                    this.autoFireModule.StopFire()
                }
            }
        }, false, this.bindData.Fire.PC.Input)

        ContextActionService.BindAction(this.bindData.Reload.Action, (name, state) => {
            if (name === this.bindData.Reload.Action && state === Enum.UserInputState.Begin){
                this.remote.Reload.FireServer(this.weapon.GetName())
                this.weapon.Relaod()
            }
        }, false, this.bindData.Reload.PC.Input)
    }

    Unbind(){
        this.autoFireModule.StopFire()
        this.remote.StopFire.FireServer(this.weapon.GetName())
        ContextActionService.UnbindAction(this.bindData.Fire.Action)
        ContextActionService.UnbindAction(this.bindData.Reload.Action)
    }

    constructor(
        private readonly weapon: IWeapon,
        private readonly autoFireModule: AutoFireModule){}
}