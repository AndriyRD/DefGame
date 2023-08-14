import { GlobalConfig } from "shared/GlobalConfig"
import { Teams, Workspace } from "@rbxts/services"

export abstract class GameMap {
    protected readonly model
    protected readonly ParentContainer = Workspace
    protected readonly SpawnCF = new CFrame

    GetModel(){
        return this.model
    }

    Sapwn(){
        this.model.Parent = Workspace
        this.model.PivotTo(this.SpawnCF)
        this.model.Name = GlobalConfig.LAODED_MAP_NAME
    }

    GetID(){
        return this.id
    }

    Destory(){
        this.model.Destroy()
        table.clear(this)
    }

    constructor(protected readonly id: string){
        const origin = GlobalConfig.MAP_MODEL_STORAGE.WaitForChild(id) as Model
        this.model = origin.Clone()
    }
}