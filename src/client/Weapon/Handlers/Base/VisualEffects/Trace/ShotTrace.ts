import { ReplicatedStorage, Workspace } from "@rbxts/services";
import { IWeaponModel } from "shared/Weapon/WeaponModel/IWeaponModel";
import { TraceBeamTransparencyAnimation } from "./TraceBeamTransparencyAnimation";
import { GlobalConfig } from "shared/GlobalConfig";
const weaponDir = ReplicatedStorage.WaitForChild('Weapon')
const weaponInstances = weaponDir.WaitForChild('Instances')

export class ShotTrace {
    private readonly originBeam = weaponInstances.WaitForChild('TraceBeam') as Beam
    private readonly lifeTime = .4
    private readonly conatiner = GlobalConfig.DEBRIS
    private readonly tweenInfo = new TweenInfo(this.lifeTime)
    private readonly beamAnimation = new TraceBeamTransparencyAnimation(this.tweenInfo, .1)
    private readonly attachContainer: BasePart

    private SpawnBeam(main: Attachment, targetAttach: Attachment){
        const newBeam = this.originBeam.Clone()
        newBeam.Parent = this.conatiner
        newBeam.Attachment0 = main
        newBeam.Attachment1 = targetAttach
        return newBeam
    }

    private CreateAttachment(parent: BasePart, pos: Vector3){
        const attach = new Instance('Attachment')
        attach.Parent = parent
        attach.WorldPosition = pos
        return attach
    }

    Destroy(){
        this.attachContainer.Destroy()
    }

    Create(pos: Vector3){
        const mainAttach = this.CreateAttachment(this.attachContainer, this.weaponModel.Muzzle.Position)
        const tragetAttach = this.CreateAttachment(this.attachContainer, pos)
        const beam = this.SpawnBeam(mainAttach, tragetAttach)
        this.beamAnimation.Animate(beam, () => tragetAttach.Destroy())
    }

    constructor(private readonly weaponModel: IWeaponModel){
        this.attachContainer = new Instance('Part', Workspace)
        this.attachContainer.Anchored = true
        this.attachContainer.Transparency = 1
        this.attachContainer.Position = new Vector3()
    }
}