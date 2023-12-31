import { CollectionService, ContextActionService } from "@rbxts/services";
import { EventProvider } from "client/EventProvider";
import CreateStaminaUI from "client/UI/RunnerStamina/CreateStaminaUI";
import { AnimationWithSound } from "shared/Character/Animation/AnimationWithSound";
import { GlobalConfig } from "shared/GlobalConfig";
import { RemoteProvider } from "shared/RemoteProvider";
import { BaseRunner } from "shared/Runner/BaseRunner";
import { CoverHandler } from "./CoverHandler/CoverHandler";
import { AssetInstance } from "shared/AssetInstance/AssetInstance";

export class Runner extends BaseRunner {
    private readonly animation
    private readonly bindData = GlobalConfig.BIND_DATA.Run
    private readonly remote = RemoteProvider.GetForRunner()
    private readonly coverHandler = new CoverHandler(this.character)

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
        CollectionService.AddTag(this.owner, GlobalConfig.TAGS.RUN_STATE)
        // this.coverHandler.Start()
        return this
    }

    Stop(): BaseRunner {
        this.remote.Stop.FireServer()
        this.stamina.SetConsuptionMode(false)
        this.animation.GetTrack()?.Stop()
        CollectionService.RemoveTag(this.owner, GlobalConfig.TAGS.RUN_STATE)
        EventProvider.Runner.Stop.Fire()
        return this
    }

    constructor(owner: Player, runAnimationID: string){
        super(owner)
        this.animation = new AnimationWithSound(
            owner, 
            AssetInstance.CreateByID(runAnimationID, "Animation"),
            new Map())
        CreateStaminaUI(this.stamina)
    }
}