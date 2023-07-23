import Roact from "@rbxts/roact"
import TextFrame from "./TextFrame"
import { Styles } from "../Styles"

type props = {
    title: string, 
    price: number, 
    size: UDim2, 
    onSelect:((name: string)=>void) | undefined
}

export = (props: props) => {
    return (
        <frame
            Key={'ProductCard'}
            AnchorPoint={new Vector2(.5,.5)}
            BackgroundColor3={Color3.fromHex('#5c5b5d')}
            Transparency={.3} Size={props.size}
            BorderColor3={Styles.StandartBorderColor}
            Event={{
                MouseEnter: rbx => (rbx.BorderColor3 = Styles.ActiveRedColor),
                MouseLeave: rbx => (rbx.BorderColor3 = Styles.StandartBorderColor),
            }}>
                <TextFrame text={props.title}/>
                <textbutton
                    Size={new UDim2(1,0,1,0)}
                    AnchorPoint={new Vector2(.5,.5)}
                    Position={new UDim2(.5,0,.5,0)}
                    Transparency={1}
                    Event={{
                        Activated: () => props.onSelect ? props.onSelect(props.title):()=>{}
                    }}/>
        </frame>
    )
}