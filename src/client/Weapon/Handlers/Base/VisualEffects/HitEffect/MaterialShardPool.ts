import { GeneratedObjectPool } from "shared/ObjectPool/GeneratedObjectPool";
import { TempItem } from "shared/ObjectPool/TempItem";
import { MaterialShards } from "./MaterialShards";
import { ObjectPool } from "shared/ObjectPool/ObjectPool";
import { InstancePool } from "shared/ObjectPool/InstancePool";

export class MaterialShardPool extends MaterialShards {
    private readonly shardPool = new InstancePool(this.lifeTime.Max, undefined)

    private MoveShard(shards: [BasePart], pos: Vector3){

    }
}