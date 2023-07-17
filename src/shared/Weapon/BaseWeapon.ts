import { RunService } from "@rbxts/services";
import { AmmoContainer } from "./Ammo/AmmoContainer";
import { WeaponAnimation } from "./Animation/WeaponAnimation";
import { IWeaponAssets } from "./Asset/IWeaponAssets";
import { WeaponAssetParser } from "./Asset/WeaponAssetParser";
import { IWeapon } from "./IWeapon";
import { IWeaponConfig } from "./IWeaponConfig";
import { IWeaponModel } from "./IWeaponModel";

export class BaseWeapon implements IWeapon {
    private readonly assets;
    private readonly animation: WeaponAnimation

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

    GetAssets(){
        return this.assets
    }

    Relaod(): IWeapon {
        if (RunService.IsClient())
            this.animation.PlayReload()
        this.GetAmmoContainer().Reload()
        return this
    }

    constructor(
        private readonly owner: Player,
        private readonly name: string,
        private readonly model: IWeaponModel,
        private readonly config: IWeaponConfig,
        private readonly ammo: AmmoContainer,
    ){
        this.assets = WeaponAssetParser.Parse(this.name) as IWeaponAssets
        this.animation = new WeaponAnimation(this)
    }
}