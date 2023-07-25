import Roact from "@rbxts/roact"
import StaminaFrame from "./StaminaFrame"
import { Stamina } from "shared/Runner/Stamina"
import { Players } from "@rbxts/services"
import GetPlayerGui from "../GetPlayerGui"

const main = (stamina: Stamina) => {
    return (
        <StaminaFrame stamina={stamina}/>
    )
}

export = (stamina: Stamina) => {
    Roact.mount(main(stamina), GetPlayerGui(), 'Stamina')
}