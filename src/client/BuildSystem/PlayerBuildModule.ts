import { EventProvider } from "client/EventProvider";
import { BuildBindModule } from "./BuildBindModule";
import { BuildController } from "./BuildController";
import { RemoteProvider } from "shared/RemoteProvider";

export class PlayerBuildModule {
    private readonly controller = new BuildController()
    private readonly bindModule = new BuildBindModule()

    private Unbind(){
        this.bindModule.Unbind()
    }

    private OnCancel(){
        this.controller.Cancel()
        this.Unbind()
    }

    private OnBuild(){
        this.controller.Build()
        this.OnCancel()
    }

    Preview(id: string){
        this.controller.PreviewMode(id)
        this.bindModule.BindBuild(() => this.OnBuild())
        this.bindModule.BindCancle(() => this.OnCancel())
        this.bindModule.BindRotation((toRight) => this.controller.RotationMode(toRight))
    }

    constructor(){
        EventProvider.Build.PreviewMode.Event.Connect((id) => this.Preview(id))
    }
}