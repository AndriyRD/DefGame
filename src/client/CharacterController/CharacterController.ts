import { Players } from "@rbxts/services"
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter"
import { RotateModule } from "./RotateModule"
import { IStateSwithable } from "shared/IStateSwithable"
import { TopDownCamera } from "./TopDownCamera"
import { RotatedUpperTorso } from "./RotatedUpperTorso"

enum CHARACTER_MODULES {
    TOP_DOWN_CAMERA,
    CHARACTER_ROTATE,
    TORSO_ANDLE
}

type CharatcerModulesKeys = keyof typeof CHARACTER_MODULES

export class CharacterController {
    private static readonly owner = Players.LocalPlayer
    private static readonly character = new ReloadableCharacter(CharacterController.owner)
    private static readonly characterModules = new Map<CharatcerModulesKeys, IStateSwithable>
    private static inited = false

    static Startup(){
        if (this.inited) return warn(`CharatcerController inited!`)

        CharacterController.characterModules.set("TOP_DOWN_CAMERA",
            new TopDownCamera(CharacterController.owner, CharacterController.character))

        CharacterController.characterModules.set("CHARACTER_ROTATE", 
            new RotateModule(CharacterController.owner, CharacterController.character))

        CharacterController.characterModules.set("TORSO_ANDLE", 
            new RotatedUpperTorso(this.character.GetCharacter(), this.owner.GetMouse()))

        this.inited = true
    }

    static SwithModuleState(moduleName: CharatcerModulesKeys, enabled: boolean){
        const charcterModule = CharacterController.characterModules.get(moduleName)
        if(!charcterModule) error(`Not found character-controller module: ${moduleName}`)
        if(enabled)
            charcterModule.Enable()
        else
            charcterModule.Disable()
    }
}