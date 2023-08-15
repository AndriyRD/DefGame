import { IWeaponAssets } from "./Asset/IWeaponAssets";
import { WeaponAssetParser } from "./Asset/WeaponAssetParser";
import { IWeapon } from "./IWeapon";
import { IWeaponConfig } from "./IWeaponConfig";
import { IWeaponModel } from "./WeaponModel/IWeaponModel";
import { IFireModule } from "./IFireModule";
import { WeaponState } from "./WeaponState";
import { AmmoContainer } from "./Ammo/AmmoContainer";

export class BaseWeapon implements IWeapon<IWeaponConfig, IWeaponModel>{
    protected readonly assets;
    readonly State: WeaponState;

    ChangeFireState(val: boolean): boolean {
        return false
    }

    GetName(): string {
        return this.name;
    }

    GetConfig(){
        return this.config;
    }

    GetAssets(){
        return this.assets
    }

    constructor(
        protected readonly name: string,
        public readonly WeaponModel: IWeaponModel,
        protected readonly config: IWeaponConfig,
        protected readonly fireModule: IFireModule
    ){
        this.assets = WeaponAssetParser.Parse(this.name) as IWeaponAssets
        this.State = new WeaponState(fireModule, new AmmoContainer(this.config.AmmoConfig))
    }
    
}