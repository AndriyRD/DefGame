import Roact from "@rbxts/roact";
import ProductCard from "client/UI/Product/ProductCard";
import { IBaseProduct } from "shared/Products/IBaseProduct";

export = (props: {products: Array<IBaseProduct>, ySize: number}) => {
    return (
        <frame BackgroundTransparency={1}
            AnchorPoint={new Vector2(.5,.5)}
            Size={new UDim2(1,0,props.ySize,0)}>
                <uilistlayout FillDirection={"Horizontal"}></uilistlayout>
                {props.products.map((v) => 
                    <ProductCard price={v.Price} size={new UDim2(.18,0,1,0)} title={v.ID}/>)}
        </frame>
    )
}