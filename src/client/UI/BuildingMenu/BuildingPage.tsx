import Roact from "@rbxts/roact";
import { BUILDING_CATEGORIES } from "shared/Products/BUILDING_CATEGORIES";

export = (props: {category: BUILDING_CATEGORIES}) => {
    return (
        <scrollingframe
            BackgroundTransparency={0}
            AnchorPoint={new Vector2(0,0)}
            Position={new UDim2(.5,0,.5,0)}
            Size={new UDim2(1,0,1,0)}>
                
        </scrollingframe>
    )
}