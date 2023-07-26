import { Building } from "./Building";

export interface IActionBuilding extends Building{
    GetActions(): Array<string>
}