import { BaseRunner } from "shared/Runner/BaseRunner";

export class Runner extends BaseRunner {
    private defaultSpeed = 16
    private runSpeed = 32
    private readonly humanoid

    Run(): BaseRunner {
        this.humanoid.WalkSpeed = this.runSpeed
        return this;
    }

    Stop(): BaseRunner {
        this.humanoid.WalkSpeed = this.defaultSpeed
        return this;
    }

    constructor(owner: Player){
        super(owner)
        this.humanoid = this.character.GetHumanoid()
    }
}