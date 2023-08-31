import { ContextActionService } from "@rbxts/services";
import { IReloadebleWeapon } from "shared/Weapon/IReloadebleWeapon";
import { BindedWeapon } from "./BindedWeapon";

export class ReloadebleBindedWeapon extends BindedWeapon<IReloadebleWeapon> {

    Bind(): void {
        ContextActionService.BindAction(this.bindData.Reload.Action, (name, state) => {
            if (name === this.bindData.Reload.Action && state === Enum.UserInputState.Begin){
                this.remote.Reload.FireServer(this.name)
                this.weapon.Reload()
            }
        }, false, this.bindData.Reload.PC.Input)
    }

    Unbind(): void {
        ContextActionService.UnbindAction(this.bindData.Reload.Action)
    }
}