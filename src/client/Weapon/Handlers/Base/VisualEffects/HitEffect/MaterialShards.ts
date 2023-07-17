import { Debris } from "@rbxts/services"
import { GlobalConfig } from "shared/GlobalConfig"
import { VectorUtility } from "shared/VectorUtility"

export class MaterialShards {
    private readonly size = new NumberRange(.2, .5)
    private readonly velocity = new NumberRange(-20, 20)
    private readonly lifeTime = new NumberRange(1, 3)
    private readonly container = GlobalConfig.DEBRIS

    private CreateShard(pos: Vector3, material: Enum.Material){
        const shard = new Instance('Part', this.container)
        shard.Material = material
        shard.Anchored = false
        shard.CanCollide = true
        shard.AssemblyLinearVelocity = VectorUtility.CreateRandomVector(
            this.velocity.Min,
            this.velocity.Max)
        shard.Position = pos
        shard.Size = VectorUtility.CreateRandomVector(
            this.size.Min, 
            this.size.Max)
        return shard
    }

    Spawn(pos:Vector3, count: number, material: Enum.Material){
        for (const i of $range(0, count-1)) {
            const lifeTime = math.random(this.lifeTime.Min, this.lifeTime.Max)
            Debris.AddItem(this.CreateShard(pos, material), lifeTime)
        }
    }
}