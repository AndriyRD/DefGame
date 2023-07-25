import Roact from "@rbxts/roact"

export = (props: {currentCount: number, maxCount: number}) => {
    return (
        <textlabel Key={'AmmoCount'}
            Size={new UDim2(1,0,.8,0)}
            AnchorPoint={new Vector2(.5,.5)}
            Position={new UDim2(.5, 0,.2, 0)}
            BackgroundTransparency={1}
            Text={`${props.currentCount}/${props.maxCount}`}
            TextColor3={BrickColor.White().Color}
            Font={Enum.Font.RobotoMono}
            TextScaled={true}>
        </textlabel>
    )
}