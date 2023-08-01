import Roact from "@rbxts/roact";

type Props = {
    Rig: Model,
    TeamColor: Color3,
    CountOfTeams: number,
    Index: number,
    OnHover: (frame: Frame, rig: Model) => void,
    OnEndHover: (frame: Frame, rig: Model) => void,
    OnSelect: (frame: Frame) => void
}

type State = {
    Hovered: boolean
}

export class TeamFrame extends Roact.Component<Props, State>{
    private frameXSize = 1/this.props.CountOfTeams
    private frameXOffset = this.frameXSize*this.props.Index

    private OnInput(input: InputObject, frame: Frame){
        if(input.UserInputType === Enum.UserInputType.MouseButton1)
            this.props.OnSelect(frame)
    }

    public render(){
        return (
            <frame Key={this.props.Rig.Name}
                Size={new UDim2(this.frameXSize,0,1,0)}
                AnchorPoint={new Vector2(0,.5)}
                Position={new UDim2(this.frameXOffset,0,.5,0)}
                BackgroundTransparency={1}
                BackgroundColor3={this.props.TeamColor}
                Event={{
                    MouseEnter: (rbx) => this.props.OnHover(rbx, this.props.Rig),
                    MouseLeave: (rbx) => this.props.OnEndHover(rbx, this.props.Rig),
                    InputBegan: (rbx, input) => this.OnInput(input, rbx)
                }}>
            </frame>
        )
    }
}