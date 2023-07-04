import { IServiceHandler } from "./IServiceHandler"

export interface IApiService {
    GetId(): string
    readonly ServiceHandlers: Map<string, Callback>
}