import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { Building } from "shared/BuildSystem/Building/Building";
import CreateActivateButton from "./Common/CreateActivateButton";
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { Players } from "@rbxts/services";
import { IBuildingCreateData } from "shared/BuildSystem/IBuildingCreateData";
import { GlobalConfig } from "shared/GlobalConfig";
import { RemoteProvider } from "shared/RemoteProvider";

export class MachineGun extends Building {
    private readonly seat
    private readonly activateBtn;
    private readonly charatcer = new ReloadableCharacter(Players.LocalPlayer)

    protected OnActivate(){
        this.seat.Sit(this.charatcer.GetHumanoid())
    }

    protected OnUp(){

    }

    protected OnSeat(){
        this.seat.Sit(this.charatcer.GetHumanoid())
        let connection = this.seat.GetPropertyChangedSignal("Occupant").Connect(() => {
            if(this.seat.Occupant) return
            this.OnUp()
            connection.Disconnect()
        })
        RemoteProvider.GetForWeapon().CreateWeapon.FireServer(this.model)
    }

    GetID(): BUILDINGS_IDS {
        return BUILDINGS_IDS.MACHINE_GUN;
    }

    OnBuild(): void {
        this.activateBtn.Triggered.Connect(() => this.OnActivate())
    }

    constructor(data: IBuildingCreateData){
        super(data)
        this.activateBtn = CreateActivateButton()
        this.seat = this.model.FindFirstChild('Seat', true) as Seat
        this.seat.Disabled = true
        this.activateBtn.Parent = this.model.PrimaryPart
        this.activateBtn.TriggerEnded.Connect(
            (plr) => plr === Players.LocalPlayer ? this.OnSeat(): undefined)
        this.model.AddTag(GlobalConfig.TAGS.DAMAGEBLE_ENTITY)
    }
}