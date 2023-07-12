import Roact from "@rbxts/roact";

export = () => {
    return (
        <textbutton
            Size={new UDim2(.25, 0, .15, 0)}
            Position={new UDim2(.7, 0, .5, 0)}
            AnchorPoint={new Vector2(.5,.5)}
            BackgroundColor3={BrickColor.Red().Color}
            TextColor3={BrickColor.White().Color}
            Text={'Buy'}>
        </textbutton>
    )
}