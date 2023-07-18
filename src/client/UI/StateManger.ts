import { Players } from "@rbxts/services";
import { EventProvider } from "client/EventProvider";
import { GlobalConfig } from "shared/GlobalConfig";

export class StateManager {
    static readonly PlayerGUI = Players.LocalPlayer.WaitForChild('PlayerGui') as PlayerGui
    // static readonly MainScreen = StateManager.PlayerGUI.WaitForChild(GlobalConfig.UI_MAIN_SCREEN_NAME) as ScreenGui
    static ScreenNames = {
        Stamina: 'StaminaGui'
    }

    static RegsiterStamina(){
        const screen = this.PlayerGUI.WaitForChild(this.ScreenNames.Stamina) as ScreenGui
        EventProvider.Runner.Run.Event.Connect(() => (screen.Enabled = true))
        EventProvider.Runner.Stop.Event.Connect(() => (screen.Enabled = false))
    }
}