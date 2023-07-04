import { IApiService } from "./IApiService";
import { IServiceHandler } from "./IServiceHandler";

export class ExportApiFactory{
    Create<T>(apiService: IApiService): T{
        return {
            
        } as T
    }
}