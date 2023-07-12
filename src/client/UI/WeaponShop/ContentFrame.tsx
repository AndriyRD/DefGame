import Roact from "@rbxts/roact"
import ProductCard from "../Product/ProductCard"
import PRODUCT_LIST from "shared/Products/PRODUCT_LIST"
import BuyBtn from "./BuyBtn"

export = () => {
    const cardSize = new UDim2(.2,0,.45,0)

    return (
        <frame
            Key={'Content'}
            Size={new UDim2(1,0,.94,0)}
            Transparency={1}
            AnchorPoint={new Vector2(.5,.5)}
            Position={new UDim2(.5,0,0.5,0)}>
            <uilistlayout
                FillDirection={Enum.FillDirection.Horizontal}
                HorizontalAlignment={"Center"}
                Padding={new UDim(.1)}>
            </uilistlayout>

            {PRODUCT_LIST.Weapon.map((product) => 
                <ProductCard title={product.ID} price={product.Price} size={cardSize}/>
            )}
        </frame>
    )
}