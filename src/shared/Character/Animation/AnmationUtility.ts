import { AnimationConfig } from "./AnimationConfig"

export class AnimationUtility {
    static CreateByID(id: string){
        return this.CreateByURI(AnimationConfig.ANIMATION_ASSET_ID_PREFIX+id)
    }

    static CreateByURI(uri: string){
        const anim = new Instance('Animation')
        anim.AnimationId = uri
        return anim
    }
}