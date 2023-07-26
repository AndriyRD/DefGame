import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { Building } from "shared/BuildSystem/Building/Building";
import { IActionBuilding } from "shared/BuildSystem/Building/IActionBuilding";

export class Wall extends Building implements IActionBuilding {

    GetActions(){
        return []
    }

    GetID(): BUILDINGS_IDS {
        return BUILDINGS_IDS.BASE_WALL
    }
    OnBuild(): void {
        
    }
}