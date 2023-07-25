import Roact from "@rbxts/roact"
import { AmmoFrame } from "./AmmoFrame"
import GetPlayerGui from "../GetPlayerGui"

const main = () => (<AmmoFrame/>)

export = () => {
    Roact.mount(main(), GetPlayerGui(), 'AmmoFrame')
}