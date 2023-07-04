import { ContextActionService } from "@rbxts/services";
import { GlobalConfig } from "shared/GlobalConfig";
import { RemoteProvider } from "shared/RemoteProvider";
import { AutoFireModule } from "shared/Weapon/AutoFireModule";

export class BindedAutoFireModule extends AutoFireModule {
    private readonly bindData = GlobalConfig.BIND_DATA.Weapon.Fire
    private readonly remote = RemoteProvider.GetForWeapon()

    Bind(){
        ContextActionService.BindAction(this.bindData.Action, (name, state) => {
            if (name === this.bindData.Action){
                if (state === Enum.UserInputState.Begin){
                    this.remote.StartFire.FireServer(this.weapon.GetName())
                    this.StartFire()
                }
                else if (state === Enum.UserInputState.End){
                    this.remote.StopFire.FireServer(this.weapon.GetName())
                    this.StopFire()
                }
            }
        }, false, this.bindData.PC.Input)
    }

    Unbind(){
        this.StopFire()
        ContextActionService.UnbindAction(this.bindData.Action)
    }
}