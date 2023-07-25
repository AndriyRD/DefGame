import { ReloadableCharacter } from "shared/Character/ReloadableCharacter"
import { CoverDatector } from "./CoverDetector"
import { GlobalConfig } from "shared/GlobalConfig"
import { ReloadableAnimation } from "shared/Character/Animation/ReloadableAnimation"
import { CoverMoveModule } from "./CoverMoveModule"
import { Cover } from "./Cover"
import { AssetInstance } from "shared/AssetInstance/AssetInstance"

export class CoverHandler {
    protected readonly moveModule
    protected readonly detector
    protected readonly hideAnimation
    protected readonly idleAnimation
    private hided = false

    protected OnDetectCover(res: RaycastResult){
        this.hideAnimation.Play()
        this.hideAnimation.GetTrack()?.Stopped.Connect(() => {
            this.character.GetRoot().Anchored = false
            this.moveModule.SetCover(new Cover(res.Instance, res.Normal)).Enable()
        })
        this.character.GetRoot().Anchored = true
        this.hided = true
        this.moveModule.OnExit.Event.Connect(() => this.hided = false)
    }

    Start(){
        if (!this.hided){
            this.detector.StartDetectMode()
        }
    }

    constructor(protected readonly character: ReloadableCharacter){
        this.detector = new CoverDatector(character)
        this.detector.OnDetect.Event.Connect((res) => this.OnDetectCover(res))
        this.hideAnimation = new ReloadableAnimation(character, AssetInstance.CreateByID(GlobalConfig.SHELTER.HIDE_ANIMATION_ID, "Animation"))
        this.idleAnimation = new ReloadableAnimation(character, AssetInstance.CreateByID(GlobalConfig.SHELTER.IDLE_ANIMATION_ID, "Animation"))
        this.moveModule = new CoverMoveModule(character)
    }
}