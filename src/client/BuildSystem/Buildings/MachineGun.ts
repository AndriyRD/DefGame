import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { Building } from "shared/BuildSystem/Building/Building";
import CreateActivateButton from "./Common/CreateActivateButton";
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { Players } from "@rbxts/services";
import { IBuildingCreateData } from "shared/BuildSystem/IBuildingCreateData";
import { GlobalConfig } from "shared/GlobalConfig";

export class MachineGun extends Building {
    private readonly seat
    private readonly activateBtn;
    private readonly charatcer = new ReloadableCharacter(Players.LocalPlayer)

    protected OnActivate(){
        this.seat.Sit(this.charatcer.GetHumanoid())
    }

    GetID(): BUILDINGS_IDS {
        return BUILDINGS_IDS.MACHINE_GUN;
    }

    OnBuild(): void {
        print('Client on build')
        this.activateBtn.Triggered.Connect(() => this.OnActivate())
    }

    constructor(data: IBuildingCreateData){
        super(data)
        this.activateBtn = CreateActivateButton()
        this.seat = this.model.FindFirstAncestorOfClass('Seat') as Seat
        this.activateBtn.Parent = this.model.PrimaryPart
        this.model.AddTag(GlobalConfig.TAGS.DAMAGEBLE_ENTITY)
    }
}