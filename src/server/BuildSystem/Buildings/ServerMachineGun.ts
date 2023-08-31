import { WeaponServiceAPI } from "server/Weapon/FrontLayer/WeaponServiceAPI";
import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { Building } from "shared/BuildSystem/Building/Building";
import { IActionBuilding } from "shared/BuildSystem/Building/IActionBuilding";
import { IdentifiedInstance } from "shared/IdentifiedInstance";

export class MachineGun extends Building implements IActionBuilding{
    GetActions(){
        return ['Activate', 'Deavtivate', 'SendHitPackage', 'Reload']
    }

    GetID() {
        return BUILDINGS_IDS.MACHINE_GUN;
    }

    OnBuild(): void {
    }

    constructor(model: IdentifiedInstance<Model>){
        super(model)
        WeaponServiceAPI.Create(model.GetInstance())
    }
}