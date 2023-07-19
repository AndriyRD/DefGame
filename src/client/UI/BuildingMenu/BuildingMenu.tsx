import Roact from "@rbxts/roact"
import { Styles } from "../Styles"
import Navbar from "./Navbar"
import { BUILDING_CATEGORIES } from "shared/Products/BUILDING_CATEGORIES"

export = () => {
    return (
        <frame Size={new UDim2(.6,0,.6,0)}
            AnchorPoint={new Vector2(.5,.5)}
            Position={new UDim2(.5,0,.5,0)}
            BackgroundColor3={BrickColor.Black().Color}
            Transparency={Styles.Menu.Transparency}>

            <Navbar categories={[BUILDING_CATEGORIES.BASE]}></Navbar>

        </frame>
    )
}