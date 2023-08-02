import { IEntity } from "./IEntity";

export abstract class HumanoidEntity implements IEntity {
    protected humanoid: Humanoid

    protected OnDied(){
        this.Events.Died.Fire(this.model)
    }

    protected OnChangeHealth(){
        this.Events.ChangeHealth.Fire(this.model)
    }

    protected SetEventsHandles(){
        this.humanoid.Died.Connect(() => this.OnDied())
        this.humanoid.GetPropertyChangedSignal('Health').Connect(()=>this.OnChangeHealth())
    }

    readonly Events = {
        ChangeHealth: new Instance('BindableEvent'),
        Died: new Instance('BindableEvent')
    }

    Dispose(){
        this.Events.ChangeHealth.Destroy()
        this.Events.Died.Destroy()
        this.humanoid = undefined as any
        this.model = undefined as any
        table.clear(this)
    }

    GetModel(): Model {
        return this.model
    }

    TakeDamage(value: number): IEntity {
        this.humanoid.TakeDamage(value)
        return this
    }

    constructor(protected model: Model){
        this.model = model
        this.humanoid = this.model.FindFirstAncestorOfClass('Humanoid') as Humanoid
        this.SetEventsHandles()
    }
}