import { Players, ReplicatedStorage, Workspace } from "@rbxts/services";
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";

export class TeamScene {
    private readonly scene
    private readonly charcter = new ReloadableCharacter(Players.LocalPlayer)
    private readonly sceneModel = ReplicatedStorage.WaitForChild('SelectTeamScene') as Model
    private readonly camera = Workspace.CurrentCamera!
    private readonly sceneCF = new CFrame(0,-100,0)
    private readonly cameraOffset = new CFrame(0,0,-8)
    private readonly rigsContainerName = 'Rigs'
    private readonly scaleSeletcedRig = 1.08
    readonly OnSelect = new Instance('BindableEvent')

    private SetCameraToScene(){
        this.camera.CFrame = this.sceneCF.ToWorldSpace(this.cameraOffset)
        this.camera.CFrame = this.camera.CFrame.mul(
            CFrame.lookAt(this.camera.CFrame.Position, this.sceneCF.Position)).Rotation
    }

    private PlaceScene(){
        const newScene = this.sceneModel.Clone()
        newScene.Parent = Workspace
        newScene.PivotTo(this.sceneCF)
        return newScene
    }

    private OnSelectTeam(name: string){
        print(`Select team: ${name}`)
        this.OnSelect.Fire(name)
    }

    private SetClickDetectorToRigs(model: Model){
        const rigs = model.WaitForChild(this.rigsContainerName) as Model
        for (const item of rigs.GetChildren()) {
            if(item.IsA("Model")){
                const detector = new Instance('ClickDetector', item)
                detector.MouseHoverEnter.Connect(() => item.ScaleTo(this.scaleSeletcedRig))
                detector.MouseHoverLeave.Connect(() => item.ScaleTo(1))
                detector.MouseClick.Connect(() => this.OnSelectTeam(item.Name))
            }
        }
    }

    Show(){
        this.SetCameraToScene()
        this.SetClickDetectorToRigs(this.scene)
        print('Show scene')
    }

    constructor(){
        this.scene = this.PlaceScene()
    }
}