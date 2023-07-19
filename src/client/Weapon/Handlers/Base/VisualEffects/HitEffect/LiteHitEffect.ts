import { IHitEffect } from "./IHitEffect";
import { MaterialShardPull } from "./MaterialShardPull";
import { MaterialShards } from "./MaterialShards";

export class LiteHitEffect implements IHitEffect{
    private readonly countOfShards = new NumberRange(0,3)
    private readonly materialShards = new MaterialShardPull()
    private readonly materials = [
        Enum.Material.SmoothPlastic,
        Enum.Material.Plastic,
        Enum.Material.Wood
    ]
    
    Hit(pos: Vector3, material: Enum.Material): void {
        const count = math.random(this.countOfShards.Min,this.countOfShards.Max)
        if (count > 0) this.materialShards.Spawn(pos, count, material)
    }

    GetMaterials(){
        return this.materials
    }
    
}