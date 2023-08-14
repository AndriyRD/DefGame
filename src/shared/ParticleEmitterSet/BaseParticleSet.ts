import { IParticleOptions } from "./IPartcileOptions"

export class BaseParticleSet {
    private readonly emitters = new Map<ParticleEmitter, IParticleOptions>

    Emit(){
        this.emitters.forEach((options, emitter) => emitter.Emit(options.EmitParticleCount))
        return this
    }

    Add(emitter: ParticleEmitter, options: IParticleOptions){
        this.emitters.set(emitter, options)
        return this
    }
    
    AddByOrigin(emitter: ParticleEmitter, options: IParticleOptions){
        const newEmitter = emitter.Clone() 
        this.Add(newEmitter, options)
        newEmitter.Parent = this.attachment
        return this
    }

    Enable(){
        this.emitters.forEach((_, v) => v.Enabled = true)
    }

    Disable(){
        this.emitters.forEach((_, v) => v.Enabled = false)
    }

    Dispose(){
        this.emitters.forEach((options, emitter) => emitter.Destroy())
        this.emitters.clear()
        table.clear(this)
    }

    constructor(private readonly attachment: Attachment){

    }
}