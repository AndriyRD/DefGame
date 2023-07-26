import { IViewModelConfiguration } from "./IViewModelConfiguration"
import { RotateModule } from "./RotateModule"
import { ViewModelLoader } from "./ViewModelLoader"
import { GlobalConfig } from "shared/GlobalConfig"

export class ViewModel {
    private model
    private availableBuild = true
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
                item.Transparency = this.vmConfig.Transparency
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

    Dispose(){
        this.model?.Destroy()
        table.clear(this.vmConfig)
        table.clear(this)
    }

    ChangeState(){
        this.availableBuild = !this.availableBuild
        if(this.availableBuild)
            this.ChacngeModelColor(this.vmConfig.ModelColors.Available)
        else this.ChacngeModelColor(this.vmConfig.ModelColors.Cancaled)
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

    constructor(id: string, private readonly vmConfig: IViewModelConfiguration){
        this.model = ViewModelLoader.Load(id)
        this.InitModel()
        this.rotateModule = new RotateModule(this.model)
    }
}