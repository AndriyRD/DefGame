import Roact, { createElement } from "@rbxts/roact";
import { Players } from "@rbxts/services";
import WeaponShop from "./WeaponShop/WeaponShop";
const playerGui = Players.LocalPlayer.FindFirstChild('PlayerGui')

export = () => {
    const app = (
        <screengui Enabled = {true} ResetOnSpawn={false} IgnoreGuiInset={true}>
            <WeaponShop></WeaponShop>
        </screengui>
    )

    Roact.mount(app, playerGui, 'MainUI')
}