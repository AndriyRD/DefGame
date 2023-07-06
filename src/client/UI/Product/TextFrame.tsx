import Roact from "@rbxts/roact";
import Title from "./Title";

export = (props: {text: string}) => {
    return (
        <frame 
            BackgroundColor3={Color3.fromHex('#49494a')} Transparency={.25}>
            <Title
                text={props.text} 
                pos={new UDim2(0.5,0,0.85,0)}
                size={new UDim2(1,0,0,0.2)}>
            </Title>
        </frame>
    )
}