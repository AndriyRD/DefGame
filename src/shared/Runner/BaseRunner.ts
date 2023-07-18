import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { Stamina } from "./Stamina";

export abstract class BaseRunner {
    protected readonly character: ReloadableCharacter
    protected readonly stamina = new Stamina(100, 1)

    abstract Run(): BaseRunner
    abstract Stop(): BaseRunner

    constructor(protected readonly owner: Player){
        this.character = new ReloadableCharacter(owner)
        this.stamina.OnEndStamina.Event.Connect(() => this.Stop())
    }
} 