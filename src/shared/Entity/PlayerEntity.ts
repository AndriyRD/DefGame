import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { IEntity } from "./IEntity";
import { HumanoidEntity } from "./HumanoidEntity";
import GetCharacter from "shared/Character/GetCharacter";

export class PlayerEntity extends HumanoidEntity {
    private readonly character

    protected OnDied(): void {
        super.OnDied()
        this.model = this.character.GetCharacter()
        this.humanoid = this.character.GetHumanoid()
    }

    GetModel(): Model {
        return this.character.GetCharacter()
    }

    TakeDamage(value: number): IEntity {
        this.character.GetHumanoid().TakeDamage(value)
        return this
    }

    constructor(private readonly owner: Player){
        super(GetCharacter(owner))
        this.character = new ReloadableCharacter(owner)
    }
}