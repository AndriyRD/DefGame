import Roact from "@rbxts/roact";
import ContentFrame from "./ContentFrame";
import BuyBtn from "./BuyBtn";

const WeaponShop = (
    <frame 
        Key={'WeaponShop'}
        Size={new UDim2(.5,0,.6,0)} 
        BackgroundColor3={Color3.fromHex('#707070')} 
        Position={new UDim2(.5,0,.5,0)}
        Transparency={.6} AnchorPoint={new Vector2(.5,.5)}
        BorderColor3={BrickColor.White().Color}>

        <ContentFrame/>
        <BuyBtn></BuyBtn>
    </frame>
)

export = () => {
    return WeaponShop
}