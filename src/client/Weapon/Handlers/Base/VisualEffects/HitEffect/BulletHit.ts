import { IHitEffect } from "./IHitEffect";
import { LiteHitEffect } from "./LiteHitEffect";

export class BulletHit {
    private readonly defaultHitEffect = new LiteHitEffect()
    private readonly hitEffects = new Array<IHitEffect>()

    private GetHitEffectByMaterial(hitMaterial: Enum.Material){
        for (const item of this.hitEffects) {
            for (const material of item.GetMaterials()) {
                if (material === hitMaterial)
                    return item
            }
        }
    }

    Spawn(part: BasePart, pos: Vector3){
        let hitEffect = this.GetHitEffectByMaterial(part.Material)
        if (!this.GetHitEffectByMaterial) hitEffect = this.defaultHitEffect
        hitEffect!.Hit(pos, part.Material)
    }

    constructor(){
        this.hitEffects.push(this.defaultHitEffect)
    }
}