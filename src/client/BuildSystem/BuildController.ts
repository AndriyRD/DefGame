import BaseViewModelConfig from "./ViewModel/BaseViewModelConfig";
import { ViewModel } from "./ViewModel/ViewModel";

export class BuildController {
    private viewModel: ViewModel | undefined
    private readonly viewModelConfig = BaseViewModelConfig
    
    BuildMode(buildingID: string){
        if (this.viewModel)
            this.viewModel.LoadNewModel(buildingID);
        this.viewModel = new ViewModel(buildingID, this.viewModelConfig)
    }

    Cancel(){
        this.viewModel?.Destroy()
    }
}