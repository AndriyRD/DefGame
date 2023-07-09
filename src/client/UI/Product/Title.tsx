import Roact from "@rbxts/roact"
export = (props: {text: string, pos: UDim2, size: UDim2}) => {
    return (
        <textlabel
            BackgroundTransparency={1}
            Text={props.text} 
            Font={Enum.Font.SourceSans}
            TextColor3={Color3.fromHex('#fdfaff')}
            TextScaled={true}
            Position={props.pos}
            Size={props.size}
            AnchorPoint={new Vector2(.5,.5)}>
        </textlabel>
    )
}