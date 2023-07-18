import Roact from "@rbxts/roact";
import { Stamina } from "shared/Runner/Stamina";

type props = {stamina: Stamina}
type state = {size: UDim2}

export class StaminaBar extends Roact.Component<props, state>{

    private GetSize(staminaValue: number){
        const max = this.props.stamina.GetMaxValue()
        const x = 1-(1-(staminaValue/max))
        return new UDim2(x,0,1,0)
    }

    protected didMount(): void {
        this.props.stamina.OnUpdateValue.Event.Connect((v) => {
            this.setState({size: this.GetSize(v)})
        })
        this.setState({size: new UDim2(1,0,1,0)})
    }
    
    public render(): Roact.Element | undefined {
        return (
            <frame
                Size={this.state.size}
                BackgroundColor3={BrickColor.White().Color}
                Transparency={.35}
                AnchorPoint={new Vector2(.5,.5)}
                Position={new UDim2(.5,0,.5,0)}>

            </frame>
        )
    }

    constructor(props: props){
        super(props)
    }
}