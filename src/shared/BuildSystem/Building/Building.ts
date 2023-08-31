import { IdentifiedInstance } from "shared/IdentifiedInstance";
import { BUILDINGS_IDS } from "./BUILDINGS_IDS";

export abstract class Building {
    abstract GetID(): BUILDINGS_IDS
    abstract OnBuild(): void
    protected readonly buildingModelInstance: Model

    OnDestroy(){
        this.model.GetInstance().Destroy();
        (this.model as any) = undefined
        table.clear(this)
    }

    constructor(protected readonly model: IdentifiedInstance<Model>){
        this.buildingModelInstance = model.GetInstance()
    }
}