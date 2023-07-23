import { IViewModelConfiguration } from "./IViewModelConfiguration"
import { RotateModule } from "./RotateModule"
import { ViewModelLoader } from "./ViewModelLoader"
import { GlobalConfig } from "shared/GlobalConfig"

export class ViewModel {
    private model
    private availableBuild = false
    private rotateModule
    private rotation = false

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

    IsAvailableBuild(){
        return this.availableBuild
    }

    GetModel(){
        return this.model
    }

    View(){
        this.model.Parent = GlobalConfig.DEBRIS
        return this
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
        this.rotateModule.SetNewModel(this.model)
    }

    GetBuildingName(){
        return this.model.Name
    }

    GetCF(){
        return this.model.GetPivot()
    }

    StartRotation(toRight: boolean){
        this.rotateModule.Rotation(toRight)
        this.rotation = true
    }

    StopRotation(){
        this.rotateModule.CancelIfRotateion()
        this.rotation = false
    }

    IsRotation(){
        return this.rotation
    }

    constructor(id: string, private readonly config: IViewModelConfiguration){
        this.model = ViewModelLoader.Load(id)
        this.InitModel()
        this.rotateModule = new RotateModule(this.model)
    }
}