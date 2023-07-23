import { Players, RunService, Workspace } from "@rbxts/services";
import { IMoveHandler } from "./IMoveHandler";
import { GlobalConfig } from "shared/GlobalConfig";
import { ViewModel } from "./ViewModel";
import CanBuild from "shared/BuildSystem/CanBuild";

export class MouseMoveHandler implements IMoveHandler {
    private readonly player = Players.LocalPlayer
    private readonly mouse = this.player.GetMouse()
    private readonly rayParams = new RaycastParams()
    private readonly camera = Workspace.CurrentCamera!
    private readonly maxDistance = 200
    private connection: RBXScriptConnection | undefined

    private Move(viewModel: ViewModel, pos: Vector3){
        const model = viewModel.GetModel()
        model.PivotTo(new CFrame(pos).mul(model.GetPivot().Rotation))
        if(CanBuild(viewModel.GetModel(), viewModel.GetCF())){
            if(!viewModel.IsAvailableBuild())
                viewModel.ChangeState()
        } else
            if(viewModel.IsAvailableBuild())
                viewModel.ChangeState()
    }

    private OnRender(viewModel: ViewModel){
        const cameraPos = this.camera.CFrame.Position
        const mousePos = this.mouse.Hit.Position
        const dir = CFrame.lookAt(cameraPos, mousePos).LookVector
        const res = Workspace.Raycast(cameraPos, dir.mul(this.maxDistance), this.rayParams)
        if(res)
            this.Move(viewModel, res.Position)
    }

    Start(viewModel: ViewModel): IMoveHandler {
        this.rayParams.FilterDescendantsInstances.push(viewModel.GetModel())
        this.connection = RunService.Heartbeat.Connect(() => this.OnRender(viewModel))
        viewModel.ChangeState()
        return this
    }

    Stop(): IMoveHandler {
        this.connection?.Disconnect()
        return this
    }

    constructor(){
        this.rayParams.FilterDescendantsInstances = [GlobalConfig.DEBRIS]
        this.rayParams.FilterType = Enum.RaycastFilterType.Exclude
    }
}