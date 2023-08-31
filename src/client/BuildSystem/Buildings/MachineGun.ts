import { BUILDINGS_IDS } from "shared/BuildSystem/Building/BUILDINGS_IDS";
import { Building } from "shared/BuildSystem/Building/Building";
import CreateActivateButton from "./Common/CreateActivateButton";
import { ReloadableCharacter } from "shared/Character/ReloadableCharacter";
import { Players } from "@rbxts/services";
import { IBuildingCreateData } from "shared/BuildSystem/IBuildingCreateData";
import { GlobalConfig } from "shared/GlobalConfig";
import { WeaponProvider } from "client/Weapon/WeaponProvider";
import { BaseWeapon } from "shared/Weapon/Weapons/BaseWeapon";
import { BindedWeapon } from "client/Weapon/BindedWeapon/BindedWeapon";
import { AutoFire } from "shared/Weapon/FireModule/AutoFire";

export class MachineGun extends Building {
    private readonly seat
    private readonly activateBtn;
    private readonly charatcer = new ReloadableCharacter(Players.LocalPlayer)
    private readonly weapon: BaseWeapon
    private readonly bindedWeapon: BindedWeapon
    
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
        // RemoteProvider.GetForWeapon().CreateWeapon.FireServer(this.model)
        this.weapon.OwnerState.ChagneOwner(plr)
        this.bindedWeapon.Bind()
    }

    GetID(): BUILDINGS_IDS {
        return BUILDINGS_IDS.MACHINE_GUN;
    }

    OnBuild(): void {
        this.activateBtn.Triggered.Connect((plr) => this.OnActivate(plr))
    }

    constructor(data: IBuildingCreateData){
        super(data)
        this.activateBtn = CreateActivateButton()
        this.seat = this.model.FindFirstChild('Seat', true) as Seat
        this.seat.Disabled = true
        this.activateBtn.Parent = this.model.PrimaryPart
        this.model.AddTag(GlobalConfig.TAGS.DAMAGEBLE_ENTITY)
        this.activateBtn.TriggerEnded.Connect(
            plr => plr === Players.LocalPlayer ? this.OnSeat(plr!): undefined)
        this.weapon = WeaponProvider.RegisterWeapon<BaseWeapon>(data.Model)
        this.bindedWeapon = new BindedWeapon(this.weapon, new AutoFire(this.weapon.fireModule))
    }
}