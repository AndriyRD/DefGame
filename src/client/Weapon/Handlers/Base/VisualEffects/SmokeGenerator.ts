import { Debris, TweenService } from "@rbxts/services"
import { GlobalConfig } from "shared/GlobalConfig"
math.randomseed(time())

export class SmokeGenerator {
    private readonly MAX_PARTICLES_COUNT_ON_STUD = 5
    private readonly MIN_PARTICLE_OFFSET = -1
    private readonly MAX_PARTICLE_OFFSET = 1
    private readonly SMOKE_COLORS = [
        Color3.fromHex('#676668'),
        Color3.fromHex('#848486'),
        Color3.fromHex('#393939')
    ]
    private readonly PRATICLE_SIZE = new Vector3(.17,.17,.17)
    private readonly PARTICLE_MATERIAL = Enum.Material.SmoothPlastic

    private GetParticleAxisOffset(){
        return math.random(this.MIN_PARTICLE_OFFSET, this.MAX_PARTICLE_OFFSET)/10
    }

    private GetParticleAnimtionSize(){
        return  new Vector3(math.random(), math.random(), math.random())
    }

    private GetParticleColor(){
        return this.SMOKE_COLORS[math.random(0,2)]
    }

    private GetParticleOffset(){
        return new Vector3(
            this.GetParticleAxisOffset(),
            this.GetParticleAxisOffset(),
            this.GetParticleAxisOffset())
    }

    private CraeteSmokeParticleModel(pos: Vector3){
        const part = new Instance('Part')
        part.Anchored = true
        part.Parent = GlobalConfig.DEBRIS
        part.Position = pos.add(this.GetParticleOffset())
        part.CanCollide = false
        part.BrickColor = BrickColor.Gray()
        part.Size = this.PRATICLE_SIZE
        part.Color = this.GetParticleColor()
        part.Material = this.PARTICLE_MATERIAL

        Debris.AddItem(part, 1.5)
        return part
    }

    private AnimateParticle(particle: BasePart, dir: Vector3){
        const _time = math.random()*2
        TweenService.Create(
            particle,
            new TweenInfo(_time), 
            {
                Position: particle.Position, 
                Transparency: 1,
                Size: particle.Size.add(this.GetParticleAnimtionSize())})
            .Play()
    }

    Generate(start: CFrame, length: number){
        for (let i = 0; i < this.MAX_PARTICLES_COUNT_ON_STUD; i++)
            for (let j = 0; j < length; j ++) {
                if (math.random() > 0.5){
                    const offset = start.PointToWorldSpace(new Vector3(0,0,-j))
                    
                    this.AnimateParticle(
                        this.CraeteSmokeParticleModel(offset), start.RightVector)
                }
            }
    }
}