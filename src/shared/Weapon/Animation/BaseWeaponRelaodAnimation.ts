import { AnimationWithSound } from "shared/Character/Animation/AnimationWithSound"
import { GlobalConfig } from "shared/GlobalConfig"
import { Debris } from "@rbxts/services"
import { IWeaponModel } from "../WeaponModel/IWeaponModel"

export class BaseWeaponRelaodAnimation{
    private readonly DROP_MAG_FRAME_NAME = 'DropMag'
    private readonly PUT_MAG_FRAME_NAME = 'PutMag'

    private DropMag(mag: BasePart, lifeTime: number | undefined){
        mag.Transparency = 1
        const dropped = mag.Clone()
        dropped.CanCollide = true
        dropped.Anchored = false
        dropped.Transparency = 0
        dropped.CFrame = mag.CFrame
        dropped.Parent = GlobalConfig.DEBRIS
        Debris.AddItem(dropped, lifeTime ? lifeTime : 3)
    }

    private PutMag(mag: BasePart){
        mag.Transparency = 0
    }

    private Laod(): void {
        const track = this.soundAnimation.GetTrack() as AnimationTrack
        if(track){
            const mag = this.weaponModel.Magazine

            track.GetMarkerReachedSignal(this.PUT_MAG_FRAME_NAME).Connect(() => {
                this.PutMag(mag)
            })

            track.GetMarkerReachedSignal(this.DROP_MAG_FRAME_NAME).Connect(() => {
                this.DropMag(mag, undefined)
            })

        }
    }

    Play(){
        this.soundAnimation.Play()
    }

    constructor(
        private readonly soundAnimation: AnimationWithSound,
        private readonly weaponModel: IWeaponModel)
    {
        this.soundAnimation.onLoad.Event.Connect(() => this.Laod())
        this.Laod()
    }
}