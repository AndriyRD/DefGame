import Roact from "@rbxts/roact";
import { BuildingUIStateManger } from "./BuildingUIStateManger";

type Prop = {}
type State = {CurrentCategory: string}

export class ContainerFrame extends Roact.Component<Prop, State>{
    
    protected didMount(): void {
        BuildingUIStateManger.ChangeCategory.Event.Connect((category: string) => {
            
        })
    }

    public render() {
        return (
            <frame Key={'Content'}
                BackgroundTransparency={1}
                AnchorPoint={new Vector2(.5,.5)}
                Position={new UDim2(.5,0,.5,0)}
                Size={new UDim2(.48,0,.5,0)}>

            </frame>
        )
    }
}