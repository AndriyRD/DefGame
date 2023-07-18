import Roact, { createElement } from "@rbxts/roact";
import { Players } from "@rbxts/services";
const playerGui = Players.LocalPlayer.FindFirstChild('PlayerGui')

export = () => {
    const app = (
        <screengui Enabled = {true} ResetOnSpawn={false} IgnoreGuiInset={true}>
            {/* <WeaponShop></WeaponShop> */}
            {/* <BuildingMenu></BuildingMenu> */}
        </screengui>
    )

    Roact.mount(app, playerGui, 'MainUI')
}