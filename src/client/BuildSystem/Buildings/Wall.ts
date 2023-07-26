import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { Building } from "shared/BuildSystem/Building/Building";

export class Wall extends Building {
    GetID(): BUILDINGS_IDS {
        return BUILDINGS_IDS.BASE_WALL
    }
    OnBuild(): void {
        
    }
}