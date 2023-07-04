import { AmmoContainer } from "./Ammo/AmmoContainer";
import { IWeapon } from "./IWeapon";
import { IWeaponConfig } from "./IWeaponConfig";
import { IWeaponModel } from "./IWeaponModel";

export class BaseWeapon implements IWeapon {
    GetName(): string {
        return this.name;
    }

    GetOwner(): Player {
        return this.owner;
    }

    GetWeaponModel(): IWeaponModel {
        return this.model;
    }

    GetConfig(): IWeaponConfig {
        return this.config;
    }

    GetAmmoContainer(): AmmoContainer {
        return this.ammo;
    }

    GetFireDelay(): number {
        return 1/this.GetConfig().FireSpeed
    }
    
    constructor(
        private readonly owner: Player,
        private readonly name: string,
        private readonly model: IWeaponModel,
        private readonly config: IWeaponConfig,
        private readonly ammo: AmmoContainer,
    ){}
}