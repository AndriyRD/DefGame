import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { Building } from "shared/BuildSystem/Building/Building";
import CreateActivateButton from "./Common/CreateActivateButton";
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { Players } from "@rbxts/services";
import { GlobalConfig } from "shared/GlobalConfig";
import { WeaponProvider } from "client/Weapon/WeaponProvider";
import { BaseWeapon } from "shared/Weapon/Weapons/BaseWeapon";
import { AutoFiredBindedWeapon } from "client/Weapon/BindedWeapon/AutoFiredBindedWeapon";
import { IdentifiedInstance } from "shared/IdentifiedInstance";

export class MachineGun extends Building {
    private readonly seat
    private readonly activateBtn;
    private readonly charatcer = new ReloadableCharacter(Players.LocalPlayer)
    private readonly weapon: BaseWeapon
    private readonly bindedWeapon: AutoFiredBindedWeapon
    
    protected OnActivate(plr: Player){
        this.seat.Sit(this.charatcer.GetHumanoid())
    }

    protected OnUp(){
        this.bindedWeapon.Unbind()
    }

    protected OnSeat(plr: Player){
        this.seat.Sit(this.charatcer.GetHumanoid())
        let connection = this.seat.GetPropertyChangedSignal("Occupant").Connect(() => {
            if(this.seat.Occupant) return
            this.OnUp()
            connection.Disconnect()
        })

        this.weapon.OwnerState.ChagneOwner(plr)
        this.bindedWeapon.Bind()
    }

    GetID(): BUILDINGS_IDS {
        return BUILDINGS_IDS.MACHINE_GUN;
    }

    OnBuild(): void {
        this.activateBtn.Triggered.Connect((plr) => this.OnActivate(plr))
    }

    constructor(model: IdentifiedInstance<Model>){
        super(model)
        this.activateBtn = CreateActivateButton()
        this.seat = this.buildingModelInstance.FindFirstChild('Seat', true) as Seat
        this.seat.Disabled = true
        this.activateBtn.Parent = this.buildingModelInstance.PrimaryPart
        this.buildingModelInstance.AddTag(GlobalConfig.TAGS.DAMAGEBLE_ENTITY)
        this.activateBtn.TriggerEnded.Connect(
            plr => plr === Players.LocalPlayer ? this.OnSeat(plr!): undefined)
        this.weapon = WeaponProvider.RegisterWeapon<BaseWeapon>(this.buildingModelInstance)
        this.bindedWeapon = new AutoFiredBindedWeapon(this.weapon)
    }
}