import { GlobalConfig } from "shared/GlobalConfig"
import { IMapOptions } from "./IMapOptions"
import { Workspace } from "@rbxts/services"

export class GameMap {
    protected readonly model
    protected readonly ParentContainer = Workspace
    protected readonly SpawnCF = new CFrame
    protected readonly options: IMapOptions = {
        TeamOptions: undefined
    }

    GetModel(){
        return this.model
    }

    GetOptions(){
        return this.options
    }

    Sapwn(){
        this.model.Parent = Workspace
        this.model.PivotTo(this.SpawnCF)
    }

    Destory(){
        this.model.Destroy()
        table.clear(this)
    }

    constructor(private readonly id: string){
        const origin = GlobalConfig.MAP_MODEL_STORAGE.WaitForChild(id) as Model
        this.model = origin.Clone()
    }
}