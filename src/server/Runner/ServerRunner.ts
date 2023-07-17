import { BaseRunner } from "shared/Runner/BaseRunner";

export class Runner extends BaseRunner {
    private defaultSpeed = 16
    private runSpeed = 24
    private readonly humanoid

    Dispose(){
        this.character.Destory()
    }

    Run(): BaseRunner {
        print('SERVER RUNNNER RUN')
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