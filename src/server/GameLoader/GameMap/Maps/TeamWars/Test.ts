import { Teams } from "@rbxts/services";
import { GameMap } from "../../GameMap";
import { TeamManager } from "../TeamManager";

export class Test extends GameMap {
    protected teamManager = new TeamManager()
    protected id: string = 'Test'
    Sapwn(): void {
        this.teamManager
            .CreateTeam(BrickColor.Blue(), 'Blue')
            .CreateTeam(BrickColor.Red(), 'Red')
        super.Sapwn()
    }

    constructor(){
        super(script.Name)
    }
}