import { RunService, Workspace } from "@rbxts/services"
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter"
import { CameraShaker } from "./CameraShaker"

export class CameraModule {
    private readonly camera = Workspace.CurrentCamera!
    private readonly screenGui = new Instance('ScreenGui')
    private readonly distance = new Vector3(0,35,0)
    private readonly cameraSensitivity = 20
    private readonly direction = new Vector3(0,-1,0)
    private readonly mouse
    private readonly renderStepName = 'Camera'
    private readonly shaker
    private enableShake = false

    private getMouseScreenPositionCentered(){
        return new Vector2(
            this.mouse.X - this.screenGui.AbsoluteSize.X/2,
            this.mouse.Y - this.screenGui.AbsoluteSize.Y/2)
    }

    private pixelToFraction(pixelV2: Vector2){
        return pixelV2.div(this.screenGui.AbsoluteSize)
    }

    private GetCameraCFrame(){
        const rootPart = this.character.GetRoot()
		const playerPosition = rootPart.Position.add(new Vector3(0,0,3)) 
		const cameraoffset = this.distance.add(playerPosition)

		const mouseScreenPos = this.pixelToFraction(this.getMouseScreenPositionCentered())
		const axis = new Vector3(-mouseScreenPos.Y,0,mouseScreenPos.X)

		const cameraPos = cameraoffset.add(axis.mul(this.cameraSensitivity))
        return new CFrame(cameraPos, cameraPos.add(this.direction))
    }

    private OnRender(){
        // let cf = this.GetCameraCFrame()
        // if(this.enableShake)
        //     cf = this.shaker.Next(cf)
		this.camera.CFrame = this.GetCameraCFrame()
    }

    Enable(){
        RunService.BindToRenderStep(
                this.renderStepName,
                Enum.RenderPriority.Camera.Value,
                () => this.OnRender()) 
        return this
    }

    Disable(){
        RunService.UnbindFromRenderStep(this.renderStepName)
    }

    Shake(){
        this.enableShake = true
    }

    StopShake(){
        this.enableShake = false
    }

    constructor(private readonly owner: Player, private readonly character: ReloadableCharacter){
        this.mouse = this.owner.GetMouse()
        this.screenGui.Parent = owner.WaitForChild("PlayerGui")
        this.shaker = new CameraShaker(character)
    }
}