import { ReplicatedStorage } from "@rbxts/services";
import { BufferedAttachment } from "shared/BufferedAttachment";
import { GlobalConfig } from "shared/GlobalConfig";
import { BeamAnimation } from "./BeamAnimation";

export class BulletTrace {
    protected readonly beamAnimation = new BeamAnimation
    protected readonly originBeam = ReplicatedStorage
        .WaitForChild('Weapon')
        .WaitForChild('Instances')
        .WaitForChild('BulletTrace') as Beam
    protected readonly attachmnetContainer: Part

    protected CreateTargetAttachment(worldPos: Vector3, parent: Instance){
        const attach = new Instance('Attachment')
        attach.Parent = parent
        attach.WorldPosition = worldPos
        return attach
    }

    Spawn(pos: Vector3){
        const rootAttachment = new BufferedAttachment(this.muzzlePart.Position, GlobalConfig.DEBRIS)
        const targetAttachment = this.CreateTargetAttachment(pos, this.attachmnetContainer)
        const newBeam = this.originBeam.Clone()
        newBeam.Parent = targetAttachment
        newBeam.Attachment0 = rootAttachment.GetAttachment()
        newBeam.Attachment1 = targetAttachment
        const tween = this.beamAnimation.Play(newBeam) 
        let conn = tween.Completed.Connect( state => {
            rootAttachment.Destroy()
            targetAttachment.Destroy()
            newBeam.Destroy()
            conn.Disconnect()
        })
    }

    constructor(protected readonly muzzlePart: BasePart){
        this.attachmnetContainer = new Instance('Part')
        this.attachmnetContainer.Name = 'BulletTraceAttachmentContainer'
        this.attachmnetContainer.Parent = GlobalConfig.DEBRIS
    }
}