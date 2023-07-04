import GetCharacter from "shared/Character/GetCharacter";
import { IEquipment } from "./IEquipment";
import { IEquipmentConfig } from "./IEquipmentConfig";
import { IEquipmentOrientationData } from "./IEquipmentOrientationData";
import { ReplicatedStorage, RunService } from "@rbxts/services";
import { EquipmentGlobalConfig } from "./EquipmentGlobalConfig";

const weaponDir = ReplicatedStorage.WaitForChild('Equipment') as Folder
const remote = weaponDir.WaitForChild('Remote') as Folder
const events = {
    equip: remote.WaitForChild('Equip') as RemoteEvent, 
    unequip: remote.WaitForChild('Unequip') as RemoteEvent,
    craeteEquipment: remote.WaitForChild('CreateEquipment') as RemoteEvent
}

export class Equipment implements IEquipment {
    protected equiped: boolean;
    protected Reposition(orientationData: IEquipmentOrientationData){
        const grip = this.GetGrip()
        const char = GetCharacter(this.GetOwner())
        const bodyPart = char.WaitForChild(orientationData.BodyPartName) as BasePart

        grip.Part0 = bodyPart
        grip.C0 = orientationData.Offset
        grip.Parent = this.model.PrimaryPart
    }

    protected InitGrip(){
        this.grip.Name = this.GetID() + EquipmentGlobalConfig.WEAPON_GRIP_NAME_POSTFIX
        this.grip.Part1 = this.model.PrimaryPart
        this.Reposition(this.GetConfig().Orientation.Unequip)
    }
    
    IsEquiped(): boolean {
        return this.equiped
    }

    Equip(): IEquipment {
        if (RunService.IsServer())
            this.Reposition(this.GetConfig().Orientation.Equip)
        this.equiped = true
        return this;
    }

    Unequip(): IEquipment {
        if (RunService.IsServer())
            this.Reposition(this.GetConfig().Orientation.Unequip)
        this.equiped = false
        return this;
    }

    GetModel(): Model {
        return this.model;
    }

    GetConfig(): IEquipmentConfig {
        return this.config;
    }

    GetGrip(): Motor6D {
        return this.grip;
    }

    GetOwner(): Player {
        return this.owner
    }

    GetID(): string {
        return this.id
    }

    GetEquipmentType(){
        return this.config.EquipmentType;
    }

    constructor(
        private readonly id: string,
        private readonly owner: Player,
        private readonly model: Model,
        private readonly config: IEquipmentConfig,
        private readonly grip: Motor6D){
            this.InitGrip()
            this.model.Parent = GetCharacter(owner)
            this.equiped = false
        }
}