import Roact from "@rbxts/roact";
import ProductCard from "../Product/ProductCard";

const WeaponShop = (
    <frame Size={new UDim2(.5,0,.6,0)} 
        BackgroundColor3={Color3.fromHex('#707070')} 
        Position={new UDim2(.5,0,.5,0)}
        Transparency={.4} AnchorPoint={new Vector2(.5,.5)}>

        <uilistlayout 
            FillDirection={Enum.FillDirection.Horizontal}
            HorizontalAlignment={"Center"}
            Padding={new UDim(.1)}>
        </uilistlayout>

        <ProductCard title="Test1" price={150}/>
        <ProductCard title="Test2" price={230}/>
    </frame>
)

export = () => {
    return WeaponShop
}