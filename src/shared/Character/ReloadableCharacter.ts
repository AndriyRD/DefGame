import BODY_PART_NAMES from "shared/BODY_PART_NAMES"
import { PROP_NAMES } from "shared/PROP_NAMES"
import GetCharacter from "./GetCharacter"
import { AnimationConfig } from "./Animation/AnimationConfig"

export enum CHARACTER_LOAD_EVENT_NAMES {
    ANIMATE_SCRIPT = 'OnAnimateScriptLoad',
    CHARACTER = 'OnCharatcerLoad',
    HUMANOID = 'OnHumanoidLoad',
    ANIMATOR = 'OnAnimatorLoad',
    ROOT = 'OnRootLoad'
}

export class ReloadableCharacter {
    public readonly Events = new Map<string, BindableEvent>
    private char: Model | undefined
    private hum: Humanoid | undefined
    private root: BasePart | undefined
    private animator: Animator | undefined
    private animateScript: Instance | undefined

    protected OnOwnerLeave(){
        for (const e of this.Events) {
            e[1].Destroy()
            this.Events.clear()
        }
    }

    private SetEventInstance(name: string){
        this.Events.set(name, new Instance("BindableEvent"))
    }

    private OnRealod(){
        this.char = GetCharacter(this.owner)
        this.Events.get(CHARACTER_LOAD_EVENT_NAMES.CHARACTER)!.Fire(this.char)

        this.hum = this.char.WaitForChild(PROP_NAMES.HUMANOID) as Humanoid
        this.Events.get(CHARACTER_LOAD_EVENT_NAMES.HUMANOID)!.Fire(this.hum)

        this.root = this.char.WaitForChild(BODY_PART_NAMES.MAIN.ROOT) as BasePart
        this.Events.get(CHARACTER_LOAD_EVENT_NAMES.ROOT)!.Fire(this.root)

        this.animator = this.hum.WaitForChild('Animator') as Animator
        this.Events.get(CHARACTER_LOAD_EVENT_NAMES.ANIMATOR)!.Fire(this.animator)

        this.animateScript = this.char.WaitForChild(AnimationConfig.ANIMATE_SCRIPT_NAME) as Instance
        this.Events.get(CHARACTER_LOAD_EVENT_NAMES.ANIMATE_SCRIPT)!.Fire(this.animateScript)
    }
    
    private InitEvents(){
        this.SetEventInstance(CHARACTER_LOAD_EVENT_NAMES.ANIMATE_SCRIPT)
        this.SetEventInstance(CHARACTER_LOAD_EVENT_NAMES.CHARACTER)
        this.SetEventInstance(CHARACTER_LOAD_EVENT_NAMES.HUMANOID)
        this.SetEventInstance(CHARACTER_LOAD_EVENT_NAMES.ANIMATOR)
        this.SetEventInstance(CHARACTER_LOAD_EVENT_NAMES.ROOT)

        this.owner.GetPropertyChangedSignal(PROP_NAMES.CHARACTER).Connect(()=>{
            this.OnRealod()
        })
        this.OnRealod()
    }

    GetCharacter(){
        return this.char as Model
    }

    GetHumanoid(){
        return this.hum as Humanoid
    }

    GetRoot(){
        return this.root as BasePart
    }

    GetAnimator(){
        return this.animator as Animator
    }

    GetAnimateScript(){
        return this.animateScript as Instance
    }

    Destory(){
        for (const item of this.Events)
            item[1].Destroy()
        this.Events.clear()
        this.char = undefined as any
        this.root = undefined as any
        this.hum = undefined as any
        this.animateScript = undefined as any
    }

    constructor(private readonly owner: Player){
        this.InitEvents()
    }
}