import { AnimationWithSound } from "shared/Character/Animation/AnimationWithSound"
import { IWeapon } from "../IWeapon"
import { AnimationUtility } from "shared/Character/Animation/AnmationUtility"
import { GlobalConfig } from "shared/GlobalConfig"
import { Debris } from "@rbxts/services"

export class BaseWeaponRelaodAnimation{
    private readonly DROP_MAG_FRAME_NAME = 'DropMag'
    private readonly PUT_MAG_FRAME_NAME = 'PutMag'
    private readonly soundAnimation: AnimationWithSound

    private DropMag(mag: BasePart, lifeTime: number | undefined){
        mag.Transparency = 1
        const dropped = mag.Clone()
        dropped.CFrame = mag.CFrame
        dropped.Parent = GlobalConfig.DEBRIS
        Debris.AddItem(dropped, lifeTime ? lifeTime : 3)
    }

    private PutMag(mag: BasePart){
        mag.Transparency = 1
    }

    private Laod(): void {
        const track = this.soundAnimation.GetTrack() as AnimationTrack
        if(track){
            track.KeyframeReached.Connect((name) => {
                const mag = this.weapon.GetWeaponModel().Magazine
                if(name === this.DROP_MAG_FRAME_NAME){
                    this.DropMag(mag, undefined)
                }
                else if(name === this.PUT_MAG_FRAME_NAME){
                    this.PutMag(mag)
                }
            })
        }
    }

    Play(){
        this.soundAnimation.Play()
    }

    constructor(private readonly weapon: IWeapon){
        this.soundAnimation = new AnimationWithSound(
            weapon.GetOwner(),
            AnimationUtility.CreateByID(weapon.GetConfig().AnimationSet.Relaod),
            weapon.GetAssets().Sounds.Relaod)
        this.soundAnimation.onLoad.Event.Connect(() => this.Laod())
    }
}