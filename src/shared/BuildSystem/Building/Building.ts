import { IBuildingCreateData } from "../IBuildingCreateData";
import { BUILDINGS_IDS } from "./BUILDINGS_IDS";

export abstract class Building {
    protected readonly model
    abstract GetID(): BUILDINGS_IDS
    protected readonly globalID: number
    abstract OnBuild(): void

    OnDestroy(){
        this.model.Destroy();
        (this.model as any) = undefined
        table.clear(this)
    }

    GetGlobalID(){
        return this.globalID
    }

    constructor(data: IBuildingCreateData){
        this.model = data.Model
        this.globalID = data.ID
    }
}