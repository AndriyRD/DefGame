import { BaseRunner } from "shared/Runner/BaseRunner";

export class Runner extends BaseRunner {
    private defaultSpeed = 16
    private runSpeed = 24
    private readonly humanoid

    Dispose(){
        this.character.Destory()
        this.stamina.Dispose()
    }

    Run(): BaseRunner {
        this.humanoid.WalkSpeed = this.runSpeed
        this.stamina.SetConsuptionMode(true)
        return this;
    }

    Stop(): BaseRunner {
        this.humanoid.WalkSpeed = this.defaultSpeed
        this.stamina.SetConsuptionMode(false)
        return this;
    }

    constructor(owner: Player){
        super(owner)
        this.humanoid = this.character.GetHumanoid()
    }
}