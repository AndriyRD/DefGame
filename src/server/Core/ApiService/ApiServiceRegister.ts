import { ServerScriptService } from "@rbxts/services";
import { IApiService } from "./IApiService";

export class ApiServiceRegister {
    private readonly apiServices = new Map<Folder, IApiService>;
    private readonly instnaceContainer: Folder;

    CreateMethodInstancesContainer(apiService: IApiService){
        const newContainer = new Instance('Folder', this.instnaceContainer);
        newContainer.Name = apiService.GetId()
        this.apiServices.set(newContainer, apiService)
        return newContainer
    }

    Register(apiService: IApiService){
        const container = this.CreateMethodInstancesContainer(apiService)

        apiService.ServiceHandlers.forEach((handler, key) => {
            const methodInst = new Instance("BindableFunction")
            methodInst.Parent = container
            methodInst.Name = key
            methodInst.OnInvoke = handler
        });
        return this
    }

    constructor(){
        this.instnaceContainer = new Instance("Folder")
        this.instnaceContainer.Parent = ServerScriptService
        this.instnaceContainer.Name = 'Api'
        warn('Crated Api container')
    }
}