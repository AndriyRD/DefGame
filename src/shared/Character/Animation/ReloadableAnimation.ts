import { CHARACTER_LOAD_EVENT_NAMES, ReloadableCharacter } from "../ReloadableCharacter"

export class ReloadableAnimation {
    protected readonly char: ReloadableCharacter
    protected track: AnimationTrack | undefined
    public readonly onLoad = new Instance('BindableEvent')
    private inited = false

    protected Laod(){
        this.track = this.char.GetAnimator().LoadAnimation(this.aniamtion)
        this.onLoad.Fire()
    }

    private Init(){
        this.char.Events.get(CHARACTER_LOAD_EVENT_NAMES.ANIMATOR)!.Event.Connect(()=>{
            this.track?.Destroy()
            this.Laod()
        })
        this.inited = true
    }

    private InitIfNotInited(){
        if(!this.inited) this.Init()
    }

    Destroy(){
        this.track?.Destroy()
        this.aniamtion.Destroy()
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
        owner: Player | ReloadableCharacter,
        protected readonly aniamtion: Animation){
            this.char = (owner as any).UserId ? 
                new ReloadableCharacter(owner as Player) : 
                owner as ReloadableCharacter
            this.Laod()
        }
}