import Roact from "@rbxts/roact"
import TextFrame from "./TextFrame"

export = (props: {title: string, price: number}) => {
    return (
        <frame 
            BackgroundColor3={Color3.fromHex('#5c5b5d')}
            Transparency={.3} Size={new UDim2(0.2,0,0.2,0)}>

            <TextFrame text={props.title}></TextFrame>
        </frame>
    )
}