import Roact, { createElement } from "@rbxts/roact";
import { Players } from "@rbxts/services";
import {BuildingMenu} from "./BuildingMenu/BuildingMenu";
import CreateAmmoFrame from "./Ammo/CreateAmmoFrame";
import { TeamScene } from "./SelectTeamScene/TeamScene";
const playerGui = Players.LocalPlayer.FindFirstChild('PlayerGui')

export = () => {
    const app = (
        <screengui Enabled = {true} ResetOnSpawn={false} IgnoreGuiInset={true}>
            {/* <WeaponShop></WeaponShop> */}
            <BuildingMenu></BuildingMenu>
        </screengui>
    )
    
    const teamScene = () => <TeamScene/>

    CreateAmmoFrame()
    Roact.mount(app, playerGui, 'MainUI')
    Roact.mount(teamScene(), playerGui)
}