import Roact from "@rbxts/roact";
import { Teams, TweenService } from "@rbxts/services";
import { TeamFrame } from "./TeamFrame";
import { Reflection } from "shared/Reflection";
import { AnimatedViewRig } from "./AnimatedViewRig";

type Props = {
    Rigs: Array<Model>
    OnSelectTeam: (name: string) => void
}

export class AnimatedTeamScene extends Roact.Component<Props>{
    private readonly animationTime = .8
    private readonly animatedRigs = new Map<Model, AnimatedViewRig>
    private readonly moveRigVector = new Vector3(-2,0,0)
    private readonly animationTransparencyValue = .6
    private readonly tweenInfo = new TweenInfo(this.animationTime)
    private animatedChracterFixPosition = false
    
    private GetColorByKey(key: string){
        return Reflection.ConvertObjectToMap<() => BrickColor>(BrickColor).get(key)!()
    }

    private CreateTransparencyTween(frame: Frame, v: number){
        return TweenService.Create(
            frame, 
            this.tweenInfo, 
            {Transparency: v})
    }

    private FixRigPosition(){
        if (!this.animatedChracterFixPosition){
            for (const item of this.animatedRigs) item[1].ParsePositions()
            this.animatedChracterFixPosition = true
        }
    }

    private hoverAnimate(frame: Frame, rig: Model){
        this.FixRigPosition()
        this.CreateTransparencyTween(frame, this.animationTransparencyValue).Play()
        this.animatedRigs.get(rig)!.TweenToOffset(this.moveRigVector)
    }

    private resetAnimate(frame: Frame, rig: Model){
        this.CreateTransparencyTween(frame, 1).Play()
        this.animatedRigs.get(rig)!.ResetPosition()
    }

    private selectAnimate(frame: Frame){
        this.props.OnSelectTeam(frame.Name)
    }

    protected didMount(): void {
        for (const rig of this.props.Rigs)
            for (const part of rig.GetChildren())
                this.animatedRigs.set(rig, new AnimatedViewRig(rig, this.tweenInfo))
    }

    public render(){
        return (
            <>
                {this.props.Rigs.map((v, i) =>
                    <TeamFrame TeamColor={this.GetColorByKey(v.Name).Color}
                        CountOfTeams={this.props.Rigs.size()} 
                        Index={i} Rig={v} Key={v.Name}
                        OnHover={(f, r) => this.hoverAnimate(f, r)}
                        OnEndHover={(f, r) => this.resetAnimate(f, r)}
                        OnSelect={(f) => this.selectAnimate(f)}/>)
                }
            </>
        )
    }
}