import Roact from "@rbxts/roact"
import NavbarButton from "./NavbarButton"

export  = (props: {categories: [string]}) => {
    return (
        <frame
            Key={'Navbar'}
            AnchorPoint={new Vector2(.5,.5)}
            Size={new UDim2(1,0,.06,0)}
            Position={new UDim2(.5,0,0.03,0)}
            BackgroundTransparency={1}>
            
            <uilistlayout
                FillDirection={Enum.FillDirection.Horizontal}
                Padding={new UDim()}>
            </uilistlayout>

            {props.categories.map((name) => <NavbarButton name={name}></NavbarButton>)}

        </frame>
    )
}