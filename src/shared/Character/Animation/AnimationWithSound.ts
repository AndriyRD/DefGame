import { CHARACTER_LOAD_EVENT_NAMES, ReloadableCharacter } from "shared/Character/ReloadableCharacter"

export class AnimationWithSound {
    protected readonly char: ReloadableCharacter
    protected track: AnimationTrack | undefined
    public readonly onLoad = new Instance('BindableEvent')
    private inited = false

    protected Laod(){
        this.track = this.char.GetAnimator().LoadAnimation(this.aniamtion)
        this.track!.KeyframeReached.Connect((name) => {
            this.soundSet.get(name)?.Play()
        })
        this.onLoad.Fire()
    }

    private Init(){
        this.char.Events.get(CHARACTER_LOAD_EVENT_NAMES.ANIMATOR)?.Event.Connect(()=>{
            this.track?.Destroy()
            this.Laod()
        })
    }

    private InitIfNotInited(){
        if(!this.inited) this.Init()
    }

    Destroy(){
        this.track?.Destroy()
        this.aniamtion.Destroy()
        this.soundSet.forEach((sound) => sound.Destroy())
        this.onLoad.Destroy()
    }

    GetTrack(){
        this.InitIfNotInited()
        return this.track
    }

    Play(){
        this.InitIfNotInited()
        this.track?.Play()
    }

    constructor(
        protected readonly owner: Player,
        protected readonly aniamtion: Animation,
        protected readonly soundSet: Map<string, Sound>){
            this.char = new ReloadableCharacter(this.owner)
        }
}