import { Debris } from "@rbxts/services"
import { GlobalConfig } from "shared/GlobalConfig"
import { VectorUtility } from "shared/VectorUtility"

export class MaterialShards {
    protected readonly size = new NumberRange(.2, .5)
    protected readonly velocity = new NumberRange(-20, 20)
    protected readonly lifeTime = new NumberRange(1, 3)
    protected readonly container = GlobalConfig.DEBRIS

    protected CreateShard(material: Enum.Material){
        const shard = new Instance('Part', this.container)
        shard.Material = material
        shard.Anchored = false
        shard.CanCollide = true
        return shard
    }

    protected PlaceShard(shard: BasePart, pos: Vector3){
        shard.AssemblyLinearVelocity = VectorUtility.CreateRandomVector(
            this.velocity.Min,
            this.velocity.Max)
        shard.Position = pos
        return shard
    }

    protected GenerateShardSize(){
        return VectorUtility.CreateRandomVector(
            this.size.Min, 
            this.size.Max)
    }

    protected SpawnShard(pos: Vector3, material: Enum.Material){
        const shard = this.CreateShard(material)
        shard.Size = this.GenerateShardSize()
        return this.PlaceShard(shard, pos)
    }

    GetLifeTime(){
        return this.lifeTime
    }

    Spawn(pos:Vector3, count: number, material: Enum.Material){
        const shards = []
        for (const i of $range(0, count-1)) {
            const lifeTime = math.random(this.lifeTime.Min, this.lifeTime.Max)
            const shard = this.SpawnShard(pos, material)
            shards.push(shard)
        }
        return shards
    }
}