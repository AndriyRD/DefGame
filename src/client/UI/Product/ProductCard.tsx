import Roact from "@rbxts/roact"
import TextFrame from "./TextFrame"

export = (props: {title: string, price: number, size: UDim2}) => {
    return (
        <frame 
            Key={'ProductCard'}
            AnchorPoint={new Vector2(.5,.5)}
            BackgroundColor3={Color3.fromHex('#5c5b5d')}
            Transparency={.3} Size={props.size}
            BorderColor3={BrickColor.White().Color}>
            
            <TextFrame text={props.title}></TextFrame>
        </frame>
    )
}