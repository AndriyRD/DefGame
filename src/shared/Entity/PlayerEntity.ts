import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { IEntity } from "./IEntity";
import { IEntityEvents } from "./IEntityEvents";

export class PlayerEntity implements IEntity {
    private readonly character

    private OnDied(){
        this.Events.Died.Fire(this.character.GetCharacter())
    }

    private OnChangeHealth(){
        this.Events.ChangeHealth.Fire(this.character.GetCharacter())
    }

    readonly Events = {
        ChangeHealth: new Instance('BindableEvent'),
        Died: new Instance('BindableEvent')
    }

    GetModel(): Model {
        return this.character.GetCharacter()
    }

    TakeDamage(value: number): IEntity {
        this.character.GetHumanoid().TakeDamage(value)
        return this
    }

    constructor(private readonly owner: Player){
        this.character = new ReloadableCharacter(owner)
        this.character.GetHumanoid().Died.Connect(() => this.OnDied())
        this.character.GetHumanoid().GetPropertyChangedSignal('Health').Connect(()=>this.OnChangeHealth())
    }
}