import { IViewModelConfiguration } from "./IViewModelConfiguration"
import { ViewModelLoader } from "./ViewModelLoader"
import { GlobalConfig } from "shared/GlobalConfig"

export class ViewModel {
    private model
    private availableBuild = false

    private ChacngeModelColor(color: BrickColor){
        for (const item of this.model.GetDescendants()) {
            if (item.IsA('BasePart')){
                item.BrickColor = color
            }
        }
    }

    private InitModel(){
        for (const item of this.model.GetDescendants()) {
            if(item.IsA("BasePart") || item.IsA("Decal")){
                item.Transparency = this.config.Transparency
            }
        }
    }

    View(){
        this.model.Parent = GlobalConfig.DEBRIS
    }

    Destroy(){
        this.model.Destroy()
        table.clear(this.config)
        table.clear(this)
    }

    ChangeState(){
        if(this.availableBuild)
            this.ChacngeModelColor(this.config.ModelColors.Available)
        else this.ChacngeModelColor(this.config.ModelColors.Cancaled)
        this.availableBuild = !this.availableBuild
    }

    LoadNewModel(id: string){
        if (this.model)
            this.model.Destroy()
        this.model = ViewModelLoader.Load(id)
        this.InitModel()
    }

    constructor(id: string, private readonly config: IViewModelConfiguration){
        this.model = ViewModelLoader.Load(id)
        this.InitModel()
    }
}