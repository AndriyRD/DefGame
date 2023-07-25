import Roact from "@rbxts/roact";
import { Component, Element } from "@rbxts/roact";
import AmmoLabel from "./AmmoLabel";
import { EventProvider } from "client/EventProvider";
import { AmmoContainer } from "shared/Weapon/Ammo/AmmoContainer";
import { AmmoStateManager } from "./AmmoStateManager";
import { IAmmoContainerState } from "shared/Weapon/Ammo/IAmmoContainerState";

type State = {
    Mag: number,
    Ammo: number,
    Enabled: boolean
}

export class AmmoFrame extends Component<{}, State>{
    private ammoStateManager = new AmmoStateManager()

    private OnUpdate(ammoContainerState: IAmmoContainerState){
        this.setState(ammoContainerState)
    }

    protected didMount(): void {
        EventProvider.Weapon.Equip.Event.Connect((ammoContainer: AmmoContainer, initState) => {
            this.setState({Enabled: true})
            this.OnUpdate(initState)
            this.ammoStateManager.SetAmmoContainer(ammoContainer)
        })

        EventProvider.Weapon.Unequip.Event.Connect(() => {
            this.setState({Enabled: false})
            this.ammoStateManager.Clear()
        })
        this.setState({Enabled: false})
        this.ammoStateManager.Changed.Event.Connect((state) => this.OnUpdate(state))
    }

    public render() {
        return (
            <screengui ResetOnSpawn={false} Enabled={this.state.Enabled}>
                <frame Key={'Ammo'}
                    Size={new UDim2(.16, 0, .08, 0)}
                    AnchorPoint={new Vector2(.5,.5)}
                    Position={new UDim2(.92, 0, .96, 0)}
                    Transparency={1}>

                        <AmmoLabel currentCount={this.state.Mag} maxCount={this.state.Ammo}/>
                        <frame AnchorPoint={new Vector2(.5,.5)}
                            Size={new UDim2(.9,0,.05,0)}
                            Position={new UDim2(.5,0,.8,0)}
                            BackgroundColor3={BrickColor.White().Color}
                            Transparency={0}
                            BorderSizePixel={0}>
                    </frame>
                </frame>
            </screengui>   
        )
    }
    
}