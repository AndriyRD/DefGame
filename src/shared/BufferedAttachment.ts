import { Workspace } from "@rbxts/services"

export class BufferedAttachment {
    protected readonly containerPart: BasePart
    protected readonly attachment: Attachment
    protected readonly containerSize = new Vector3(.1,.1,.1)

    protected CreateContainerPart(pos: Vector3, parent: Instance | undefined){
        const part = new Instance("Part")
        part.Parent = parent ? parent : Workspace
        part.Anchored = true
        part.CanCollide = false
        part.Size = this.containerSize
        part.Position = pos
        part.Transparency = 1
        return part
    }

    private CreateAttachment(parent: BasePart){
        const attachment = new Instance('Attachment')
        attachment.Parent = parent
        return attachment
    }

    GetAttachment = () => this.attachment

    Destroy(){
        this.attachment.Destroy()
        this.containerPart.Destroy()
        table.clear(this)
    }
    
    constructor(pos: Vector3, parent: Instance | undefined){
        this.containerPart = this.CreateContainerPart(pos, parent)
        this.attachment = this.CreateAttachment(this.containerPart)
    }
}