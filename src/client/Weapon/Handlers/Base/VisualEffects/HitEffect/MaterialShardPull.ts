import { MaterialShards } from "./MaterialShards";
import { InstancePull } from "shared/ObjectPool/InstancePull";

export class MaterialShardPull extends MaterialShards {
    private readonly shardPool = new InstancePull(this.lifeTime.Max, undefined)
    private readonly MAX_SHARDS = 10

    private ReUseShard(shard: BasePart, pos: Vector3){
        this.PlaceShard(shard, pos)
        shard.Size = this.GenerateShardSize()
    }

    Spawn(pos: Vector3, count: number, material: Enum.Material) {
        if(this.shardPool.GetSize() >= this.MAX_SHARDS){
            const freeItems = this.shardPool.GetFreeChunk(count)
            print('MAX_SIZE')
            print(freeItems)
            if(freeItems && freeItems.size() >= count){
                print('PULL IS FULL')
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
        shards.forEach((v) => this.shardPool.Push(v))
        print('Generate shards!')
        return shards
    }
}