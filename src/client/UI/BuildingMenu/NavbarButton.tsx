import Roact from "@rbxts/roact"
import { Styles } from "../Styles"

export  = (props: {name: string}) => {
    return (
        <textbutton
            Key={props.name}
            Text={props.name}
            BackgroundColor3={Styles.ActiveRedColor}
            TextColor3={BrickColor.White().Color}
            TextScaled={true}
            TextTransparency={0}
            Font={"Roboto"}
            Size={new UDim2(.2,0,1,0)}>
        </textbutton>
    )
}