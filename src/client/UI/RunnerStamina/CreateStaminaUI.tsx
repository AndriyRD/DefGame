import Roact from "@rbxts/roact"
import StaminaFrame from "./StaminaFrame"
import { StateManager } from "../StateManger"
import { Stamina } from "shared/Runner/Stamina"

const main = (stamina: Stamina) => {
    return (
        <StaminaFrame stamina={stamina}/>
    )
}

export = (stamina: Stamina) => {
    Roact.mount(main(stamina), StateManager.PlayerGUI)
}