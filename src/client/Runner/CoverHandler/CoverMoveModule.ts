import { ContextActionService } from "@rbxts/services";
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { Cover } from "./Cover";

export class CoverMoveModule {
    protected readonly actionNames = {Move: 'MoveCoverAction', Exit: 'ExitCoverAction'}
    protected readonly moveInput = [Enum.KeyCode.A, Enum.KeyCode.D]
    protected readonly exitCoverInput = [Enum.KeyCode.S, Enum.KeyCode.LeftShift]
    protected currentCove: Cover | undefined
    protected defHumSpeed: number | undefined
    protected hideHumSpeed = 12
    OnExit = new Instance('BindableEvent')

    protected MoveToPoint(point: Vector3){
        const hum = this.character.GetHumanoid()
        hum.MoveTo(point)
    }

    protected GetMovePointFromInput(input: InputObject) {
        if(input.KeyCode === this.moveInput[0])
            return this.currentCove!.GetEndLeftPoint().Position
        return this.currentCove!.GetEndRightPoint().Position
    }

    protected SetHidedSpeed(){
        const hum = this.character.GetHumanoid()
        this.defHumSpeed = hum.WalkSpeed
        hum.WalkSpeed = this.hideHumSpeed
    }

    protected ResumeSeed(){
        this.character.GetHumanoid().WalkSpeed = this.defHumSpeed ? this.defHumSpeed : 16
    }

    protected Bind(){
        ContextActionService.BindAction(this.actionNames.Move, (name, state, inputObj) => {
            if(name === this.actionNames.Move){
                if(state === Enum.UserInputState.Begin){
                    if(this.currentCove)
                        this.MoveToPoint(this.GetMovePointFromInput(inputObj))
                }
                else if(state === Enum.UserInputState.End){
                    this.MoveToPoint(this.character.GetRoot().Position)
                }
            }
        }, false, ...this.moveInput)
        
        this.SetHidedSpeed()

        ContextActionService.BindAction(this.actionNames.Exit, (name, state) => {
            if(name === this.actionNames.Exit && state === Enum.UserInputState.Begin){
                this.Unbind()
                this.currentCove = undefined
                this.ResumeSeed()
                this.OnExit.Fire()
            }
        }, false, ...this.exitCoverInput)
    }

    protected Unbind(){
        ContextActionService.UnbindAction(this.actionNames.Move)
        ContextActionService.UnbindAction(this.actionNames.Exit)
    }
    
    Enable(){
        this.Bind()
    }

    SetCover(cover: Cover){
        this.currentCove = cover
        return this
    }

    constructor(
        private readonly character: ReloadableCharacter){}
}