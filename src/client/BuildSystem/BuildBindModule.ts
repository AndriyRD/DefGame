import { GlobalConfig } from "shared/GlobalConfig";
import { ContextActionService } from "@rbxts/services";

export class BuildBindModule {
    private readonly bindData = GlobalConfig.BIND_DATA.Build

    private IsRotationToRight(input: InputObject){
        const rotationInput = this.bindData.Rotate.PC.Input
        if(input.KeyCode === rotationInput[0])
            return true
        else if(input.KeyCode === rotationInput[1])
            return false
        else error('Build bind error')
    }

    BindBuild(onBuild: () => void){
        const bindInfo = this.bindData.Build
        ContextActionService.BindAction(bindInfo.Action, (name, state) => {
            if(name === bindInfo.Action && state === Enum.UserInputState.Begin)
                onBuild()
        }, false, bindInfo.PC.Input)
    }

    BindCancle(onCancel: () => void){
        const bindInfo = this.bindData.Cancel
        ContextActionService.BindAction(bindInfo.Action, (name, state) => {
            if(name === bindInfo.Action && state === Enum.UserInputState.Begin)
                onCancel()
        }, false, ...bindInfo.PC.Input)
    }

    BindRotation(changeRotationState:(toRight: boolean) => void){
        const bindInfo = this.bindData.Rotate
        ContextActionService.BindAction(bindInfo.Action, (name, state, input) => {
            if(name === bindInfo.Action){
                if(state === Enum.UserInputState.Begin)
                    changeRotationState(this.IsRotationToRight(input))
                else if(state === Enum.UserInputState.End)
                    changeRotationState(this.IsRotationToRight(input))
            }
        }, false, ...bindInfo.PC.Input)
    }

    Unbind(){
        ContextActionService.UnbindAction(this.bindData.Build.Action)
        ContextActionService.UnbindAction(this.bindData.Cancel.Action)
        ContextActionService.UnbindAction(this.bindData.Rotate.Action)
    }
}