import Roact from "@rbxts/roact";
import { ArraySpliter } from "shared/ArraySpliter";
import { IBaseProduct } from "shared/Products/IBaseProduct";
import ListRow from "./ListRow";
const COUNT_OF_ITEMS_IN_ROW = 5

const getRows = (items: Array<IBaseProduct>) => {
    return (
        ArraySpliter.Split(items, COUNT_OF_ITEMS_IN_ROW).map(v => <ListRow products={v} ySize={.1}></ListRow>)
    )
}

export = (props: {items: Array<IBaseProduct>}) => {
    return (
        <scrollingframe Key={'List'}
            AnchorPoint={new Vector2(.5,.5)}
            Position={new UDim2(.5,0,.5,0)}
            Size={new UDim2(1,0,.75,0)}
            BackgroundTransparency={1}>
                <uilistlayout FillDirection={'Vertical'}
                    Padding={new UDim(.05)}/>

                {getRows(props.items)}
        </scrollingframe>
    )
}