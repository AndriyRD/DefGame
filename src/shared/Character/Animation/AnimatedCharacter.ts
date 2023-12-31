import { ICharatcerAnimationIDSet } from "./ICharatcerAnimationIDSet";
import CharacterAnimationIdSetToMap from "./CharacterAnimationIdSetToMap";
import { ReloadableCharacter } from "../ReloadableCharacter";
import { AnimationConfig } from "./AnimationConfig";
import { TempAnimationController } from "./TempAnimation/TempAnimationController";
import { AssetInstance } from "shared/AssetInstance/AssetInstance";

export class AnimatedCharacter {
    protected readonly tempAnimationController: TempAnimationController

    protected GetContainerName(originName: string){
        return string.lower(originName)
    }

    protected GetCharacterAnimationContainer(name: string){
        const container = this.character
            .GetAnimateScript()
            .WaitForChild(this.GetContainerName(name))

        if (!container) error(`Not fund character animation-container: ${name}`)
        return container as Instance
    }

    protected ChangeAnimationsInContainer(container: Instance, id: string){
        for (const element of container.GetChildren()) {
            if (element.IsA("Animation"))
                element.AnimationId = AssetInstance.ASSET_URI_PREFIX+id
        }
    }

    protected SetAnimationId(name: string, id: string){
        const container = this.GetCharacterAnimationContainer(name)
        this.ChangeAnimationsInContainer(container, id)
    }

    private SetAnimatinos(idList: Map<string, string>){
        for (const e of idList) {
            const name = e[0]
            const id = e[1]

            this.SetAnimationId(name, id)
        }
        this.tempAnimationController.Play()
    }

    Load(){
        this.tempAnimationController.ChangeAnimationIDSet(this.animationIDSet)
        this.SetAnimatinos(
            CharacterAnimationIdSetToMap(
                this.animationIDSet))
    }

    Reset(){
        this.tempAnimationController.ChangeAnimationIDSet(this.defaultAnimationIDSet)
        this.SetAnimatinos(
            CharacterAnimationIdSetToMap(
                this.defaultAnimationIDSet))
    }

    constructor(
        protected readonly character: ReloadableCharacter,
        protected readonly animationIDSet: ICharatcerAnimationIDSet,
        protected readonly defaultAnimationIDSet: ICharatcerAnimationIDSet){
            this.tempAnimationController = new TempAnimationController(
                this.character, 
                this.animationIDSet
            )
    }
}