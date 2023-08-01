import Roact from "@rbxts/roact";
import { Players, ReplicatedStorage, Teams, Workspace } from "@rbxts/services";
import GetPlayerGui from "../GetPlayerGui";
import { AnimatedTeamScene } from "./AnimatedTeamScene";

type State = {
    Enabled: boolean
}

export class TeamScene extends Roact.Component<{}, State>{
    private readonly sceneName = 'SelectTeamScene'
    private readonly viewPortFrameName = 'TeamSceneViewport'
    private readonly rigsContainerName = 'Rigs'
    private readonly camera = new Instance('Camera')
    private readonly scene = (ReplicatedStorage.WaitForChild(this.sceneName) as Model).Clone()
    private readonly rigs = this.scene.WaitForChild(this.rigsContainerName) as Model

    private InitViewOrientation(scene: Model){
        const sceneCF = scene.GetPivot()
        const offset = new Vector3(-8,0,0)
        const cf = CFrame.lookAt(sceneCF.PointToWorldSpace(offset), sceneCF.Position)
        this.camera.CFrame = cf
        scene.PivotTo(scene.GetPivot().mul(CFrame.Angles(0,math.rad(90),0)))
    }

    protected didMount(): void {
        this.scene.Parent = GetPlayerGui()
            .WaitForChild(this.sceneName)
            .WaitForChild(this.viewPortFrameName)
        this.InitViewOrientation(this.scene)

        this.camera.Parent = Workspace
        this.camera.Name = 'ViewPortCamera'
        
        this.setState({Enabled: true})
    }

    private OnSelectTeam(name: string){
        const plr = Players.LocalPlayer
        Teams.GetTeams().forEach((v) => name === v.Name ? plr.Team = v : undefined)
        this.setState({Enabled: false})
    }

    public render(): Roact.Element | undefined {
        return (
            <screengui Enabled={this.state.Enabled} IgnoreGuiInset={true}
            ResetOnSpawn={false} Key={this.sceneName}>
                <viewportframe Key={this.viewPortFrameName}
                    AnchorPoint={new Vector2(.5,.5)}
                    Position={new UDim2(.5,0,.5,0)}
                    Size={new UDim2(1,0,1,0)}
                    CurrentCamera={this.camera}
                    BackgroundTransparency={1}
                    LightColor={BrickColor.White().Color}
                    LightDirection={new Vector3(100, -10, 0)}/>

                <AnimatedTeamScene Rigs={this.rigs.GetChildren() as [Model]}
                    OnSelectTeam={(name) => this.OnSelectTeam(name)}/>
            </screengui>
        )
    }
}