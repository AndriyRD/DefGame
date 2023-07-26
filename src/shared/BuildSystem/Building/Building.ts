import { BUILDINGS_IDS } from "./BUILDINGS_IDS";

export abstract class Building {
    abstract GetID(): BUILDINGS_IDS

    abstract OnBuild(): void

    OnDestroy(){
        this.model.Destroy();
        (this.model as any) = undefined
        table.clear(this)
    }

    constructor(protected readonly model: Model){}
}