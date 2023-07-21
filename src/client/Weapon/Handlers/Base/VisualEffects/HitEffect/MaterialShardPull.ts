import { ChunkedObjectPull } from "shared/ObjectPool/ChunkedObjectPull";
import { MaterialShards } from "./MaterialShards";
import { InstancePull } from "shared/ObjectPool/InstancePull";

export class MaterialShardPull extends MaterialShards {
    private readonly pull = new ChunkedObjectPull(
            new InstancePull(this.lifeTime.Max))
    private readonly MAX_SHARDS = 20

    private ReUseShard(shard: BasePart, pos: Vector3){
        this.PlaceShard(shard, pos)
        shard.Size = this.GenerateShardSize()
    }

    Spawn(pos: Vector3, count: number, material: Enum.Material) {
        if(this.pull.GetSize() >= this.MAX_SHARDS){
            const freeItems = this.pull.GetChunk(count)
            if(freeItems.size() >= count){
                const res = []
                for (const item of freeItems){
                    const shard = item.GetItem() as BasePart
                    item.Update(() => 0)
                    this.ReUseShard(shard, pos)
                    res.push(shard)
                }
                return res
            }
        } 
        const shards = super.Spawn(pos, count, material)
        shards.forEach((v) => this.pull.Push(v))
        return shards
    }
}