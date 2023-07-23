import { ReplicatedStorage, Workspace } from "@rbxts/services";

export class TeamScene {
    private readonly sceneModel = ReplicatedStorage.WaitForChild('SelectTeamScene') as Model
    private readonly camera = Workspace.CurrentCamera!
    private readonly sceneCF = new CFrame(0,-100,0)
    private readonly cameraOffset = new CFrame(0,0,-8)
    private readonly rigsContainerName = 'Rigs'
    private readonly scaleSeletcedRig = 1.08

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

    private SetClickDetectorToRigs(model: Model){
        const rigs = model.WaitForChild(this.rigsContainerName) as Model
        for (const item of rigs.GetChildren()) {
            if(item.IsA("Model")){
                const detector = new Instance('ClickDetector', item)
                detector.MouseHoverEnter.Connect(() => item.ScaleTo(this.scaleSeletcedRig))
                detector.MouseHoverLeave.Connect(() => item.ScaleTo(1))
                detector.MouseClick.Connect(() => print(`Select team: ${item.Name}`))
            }
        }
    }

    Show(){
        const scene = this.PlaceScene()
        this.SetCameraToScene()
        this.SetClickDetectorToRigs(scene)
        print('Show scene')
    }
}