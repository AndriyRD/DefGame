import Roact from "@rbxts/roact"
import { Styles } from "../Styles"
import Navbar from "./Navbar"
import { BUILDING_CATEGORIES } from "shared/Products/BUILDING_CATEGORIES"
import ContantList from "./ContantFrame/ContantList"
import PRODUCT_LIST from "shared/Products/PRODUCT_LIST"

export = () => {
    return (
        <frame Key='BuildingMenu' 
            Size={new UDim2(.6,0,.6,0)}
            AnchorPoint={new Vector2(.5,.5)}
            Position={new UDim2(.5,0,.5,0)}
            BackgroundColor3={BrickColor.Black().Color}
            Transparency={Styles.Menu.Transparency}>
                <Navbar categories={[BUILDING_CATEGORIES.BASE]}></Navbar>
                <ContantList items={PRODUCT_LIST.Building}></ContantList>
        </frame>
    )
}