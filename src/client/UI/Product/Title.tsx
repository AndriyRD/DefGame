import Roact from "@rbxts/roact"
export = (prop: {text: string, pos: UDim2, size: UDim2}) => {
    return (
        <textlabel 
            Text={prop.text} 
            TextColor3={Color3.fromHex('#fdfaff')}
            TextScaled={true}
            Position={prop.pos}
            Size={prop.size}
            AnchorPoint={new Vector2(.5,.5)}>
        </textlabel>
    )
}