import { ContextActionService } from "@rbxts/services";
import { EventProvider } from "client/EventProvider";
import CreateStaminaUI from "client/UI/RunnerStamina/CreateStaminaUI";
import { AnimationWithSound } from "shared/Character/Animation/AnimationWithSound";
import { AnimationUtility } from "shared/Character/Animation/AnmationUtility";
import { GlobalConfig } from "shared/GlobalConfig";
import { RemoteProvider } from "shared/RemoteProvider";
import { BaseRunner } from "shared/Runner/BaseRunner";

export class Runner extends BaseRunner {
    private readonly animation
    private readonly bindData = GlobalConfig.BIND_DATA.Run
    private readonly remote = RemoteProvider.GetForRunner()

    Bind(){
        ContextActionService.BindAction(this.bindData.Action, (name, state) => {
            if (name === this.bindData.Action){
                if (state === Enum.UserInputState.Begin)
                    this.Run()
                else if(state === Enum.UserInputState.End)
                    this.Stop()
            }
        }, false, this.bindData.Input.PC)
    }

    Run(): BaseRunner {
        this.remote.Run.FireServer()
        this.stamina.SetConsuptionMode(true)
        this.animation.Play()
        EventProvider.Runner.Run.Fire()
        return this
    }

    Stop(): BaseRunner {
        this.remote.Stop.FireServer()
        this.stamina.SetConsuptionMode(false)
        this.animation.GetTrack()?.Stop()
        EventProvider.Runner.Stop.Fire()
        return this
    }

    constructor(owner: Player, runAnimationID: string){
        super(owner)
        this.animation = new AnimationWithSound(
            owner, 
            AnimationUtility.CreateByID(runAnimationID),
            new Map())
        CreateStaminaUI(this.stamina)
    }
}