import { TweenService, Workspace } from "@rbxts/services";
import { CHARACTER_LOAD_EVENT_NAMES, ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { VectorUtility } from "shared/VectorUtility";

export class CameraShaker {
    private readonly camera = Workspace.CurrentCamera!
    private enabled = false
    private changeStateEvent = new Instance('BindableEvent')
    private values = new Array<CFrame>()
    private valueSetSize = 5
    private currentIndex = 0
    private alpha = .1

    private GetRandomOffset(){
        return new CFrame(VectorUtility.CreateRandomVector(-1, 1))
    }

    private LerpOffset(cf: CFrame, alpha = .1, waitTime = .03){
        for(let i = 0; i<1; i+=alpha){
            task.wait(waitTime)
            this.camera.CFrame.Lerp(cf, i)
        }
    }

    private ShakeCamera(){
        if(this.enabled) return
        while (this.enabled) {
            this.LerpOffset(this.camera.CFrame.ToWorldSpace(this.GetRandomOffset()))
        }
    }

    private ChangeState(enableValue: boolean, cameraCF:CFrame|undefined){
        this.enabled = enableValue
        if(this.enabled)
            this.ShakeCamera()
        else
            this.LerpOffset(cameraCF!)
    }

    private GenerateNewValueSet(cf: CFrame){
        print(cf.Position)
        const vals = []
        const alpha = this.alpha
        const step = 1/this.valueSetSize
        for(let i = 0; i<=1; i+=step){
            vals.push(this.camera.CFrame.Lerp(cf, alpha))
            print(`Generate element: ${i}`)
        }
        print("Vals size: " + tostring(vals.size()))
        return vals
    }

    EnableShake(){
        this.changeStateEvent.Fire(true)
    }

    DisableShake(cameraCF: CFrame){
        this.changeStateEvent.Fire(false, cameraCF)
    }

    Next(cameraCF: CFrame){
        if(this.currentIndex > this.valueSetSize-1 || this.values.size()===0){
            this.currentIndex = 0
            this.values.clear()
            this.values = this.GenerateNewValueSet(cameraCF.ToWorldSpace(this.GetRandomOffset()))
        }
        const val = this.values[this.currentIndex]
        print(this.currentIndex)
        this.currentIndex++
        print(val)
        return val
    }

    constructor(private readonly character: ReloadableCharacter){
        this.changeStateEvent.Event.Connect((v) => this.ChangeState(v, undefined))
    }   
}