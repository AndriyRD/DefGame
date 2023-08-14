import { Players } from "@rbxts/services"
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter"
import { RotateModule } from "./RotateModule"
import { CameraModule } from "./CameraModule"
import { EventProvider } from "client/EventProvider"

export class CharacterController {
    private readonly owner = Players.LocalPlayer
    private readonly character = new ReloadableCharacter(this.owner)
    private readonly rotateModule
    private readonly cameraModule
    private readonly events = EventProvider.CharatcerController

    Start(){
        this.rotateModule.Enable()
        this.cameraModule.Enable()
    }

    constructor(){
        this.rotateModule = new RotateModule(this.owner, this.character)
        this.cameraModule = new CameraModule(this.owner, this.character)

        this.events.Camera.Shake.Event.Connect(() => this.cameraModule.Shake())
        this.events.Camera.Enable.Event.Connect(() => this.cameraModule.Enable())
        this.events.Camera.Disable.Event.Connect(() => this.cameraModule.Disable())
        this.events.Rotation.Enable.Event.Connect(() => this.rotateModule.Enable())
        this.events.Rotation.Disable.Event.Connect(() => this.rotateModule.Disable())
        this.events.Camera.StopShake.Event.Connect(() => this.cameraModule.StopShake())
    }
}