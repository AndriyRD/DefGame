import { ViewModel } from "./ViewModel"

export interface IMoveHandler {
    Start(viewModel: ViewModel): IMoveHandler
    Stop(): IMoveHandler
}