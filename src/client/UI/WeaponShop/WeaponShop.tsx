import Roact from "@rbxts/roact";
import ContentFrame from "./ContentFrame";
import BuyBtn from "./BuyBtn";
import { Styles } from "../Styles";

const WeaponShop = (
    <frame 
        Key={'WeaponShop'}
        Size={new UDim2(.5,0,.6,0)} 
        BackgroundColor3={Styles.Menu.BackgroundColor} 
        Position={new UDim2(.5,0,.5,0)}
        Transparency={Styles.Menu.Transparency} AnchorPoint={new Vector2(.5,.5)}
        BorderColor3={BrickColor.White().Color}>

        <ContentFrame/>
        <BuyBtn></BuyBtn>
    </frame>
)

export = () => {
    return WeaponShop
}