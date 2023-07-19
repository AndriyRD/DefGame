import Roact from "@rbxts/roact";
import { IBaseProduct } from "shared/Products/IBaseProduct";
const COUNT_OF_ITEMS_IN_ROW = 5

const getCountRows = (countOfItems: number) => {
    return math.floor(countOfItems/COUNT_OF_ITEMS_IN_ROW)
}  

const getRows = (items: Array<IBaseProduct>) => {
    return (<></>)
}

export = (props: {items: Array<IBaseProduct>}) => {
    return (
        <frame Key={'List'}
            AnchorPoint={new Vector2(.5,.5)}
            Position={new UDim2(1,0,1,0)}
            Size={new UDim2(1,0,1,0)}
            BackgroundTransparency={1}>

                {getRows(props.items)}
        </frame>
    )
}