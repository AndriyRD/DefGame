import Roact from "@rbxts/roact";
import { Stamina } from "shared/Runner/Stamina";
import { StaminaBar } from "./StaminaBar";

export = (props: {stamina: Stamina}) => {
    return (
        <screengui ResetOnSpawn={false}>
            <frame BackgroundColor3={BrickColor.Black().Color}
                    Transparency={.5}
                    AnchorPoint={new Vector2(.5,.5)}
                    Position={new UDim2(.5,0,.91,0)}
                    Size={new UDim2(.18, 0, .05, 0)}>

                        <StaminaBar stamina={props.stamina}/>
            </frame>
        </screengui>
    )
}