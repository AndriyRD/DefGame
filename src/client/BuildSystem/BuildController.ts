import { RemoteProvider } from "shared/RemoteProvider";
import BaseViewModelConfig from "./ViewModel/BaseViewModelConfig";
import { ViewModel } from "./ViewModel/ViewModel";

export class BuildController {
    private viewModel: ViewModel | undefined
    private readonly viewModelConfig = BaseViewModelConfig
    private readonly buildEvent = RemoteProvider.GetForBuild().Build
    
    RotationMode(toRight: boolean | void){
        if(this.viewModel){
            if(this.viewModel.IsRotation())
                this.viewModel.StopRotation()
            else 
                this.viewModel.StartRotation(toRight!)
        }
    }

    PreviewMode(buildingID: string){
        if (this.viewModel)
            this.viewModel.LoadNewModel(buildingID);
        this.viewModel = new ViewModel(buildingID, this.viewModelConfig)
    }

    Cancel(){
        this.viewModel?.Destroy()
    }

    Build(){
        if (this.viewModel){
            const buildingID = this.viewModel.GetBuildingName()
            this.buildEvent.FireServer(
                buildingID,
                this.viewModel.GetCF())
        }
    }
}