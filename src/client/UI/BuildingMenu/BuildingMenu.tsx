import Roact, { Component } from "@rbxts/roact"
import { Styles } from "../Styles"
import Navbar from "./Navbar"
import { BUILDING_CATEGORIES } from "shared/Products/BUILDING_CATEGORIES"
import ContantList from "./ContantFrame/ContantList"
import PRODUCT_LIST from "shared/Products/PRODUCT_LIST"
import { EventProvider } from "client/EventProvider"
import { ContextActionService } from "@rbxts/services"
import { GlobalConfig } from "shared/GlobalConfig"

type State = {
    Enabled: boolean
}

export class BuildingMenu extends Component<{}, State>{
    
    private Bind(){
        const bindData = GlobalConfig.BIND_DATA.Build.UI
        ContextActionService.BindAction(bindData.Action, (name, state) => {
            if(name === bindData.Action && state === Enum.UserInputState.Begin)
                this.setState({Enabled: !this.state.Enabled})
        }, false, bindData.PC.Input)
    }

    protected didMount(): void {
        EventProvider.Build.PreviewMode.Event.Connect(() => this.setState({Enabled: false}))
        this.Bind()
    }

    public render(): Roact.Element | undefined {
        return (
            <screengui ResetOnSpawn={false} Enabled={this.state.Enabled}>
                <frame Key='BuildingMenu' 
                    Size={new UDim2(.6,0,.6,0)}
                    AnchorPoint={new Vector2(.5,.5)}
                    Position={new UDim2(.5,0,.5,0)}
                    BackgroundColor3={BrickColor.Black().Color}
                    Transparency={Styles.Menu.Transparency}>

                    <Navbar categories={[BUILDING_CATEGORIES.BASE]}></Navbar>
                    <ContantList items={PRODUCT_LIST.Building}></ContantList>
                </frame>
            </screengui>
        )
    }
}