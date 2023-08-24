import { Weapon } from "../Weapon";
import { IWeaponBuildData } from "./IWeaponBuildData";
import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { FireModuleFactory } from "./FireModuleFactoryType";
import { IWeaponAssets } from "../Asset/IWeaponAssets";
import { IAssetParser } from "../Asset/IAssetParser";
import { IWeaponModelParser } from "../ModelParsers/IWeaponModelParser";
import { IWeapon } from "../IWeapon";

type ExtendsModel = IWeaponModel & any
type ExtendsAssets = IWeaponAssets & any

export abstract class WeaponBuilder<T extends IWeapon>{
    protected readonly buildData = {} as IWeaponBuildData<IWeaponConfig, IWeaponModel>
    protected createFireModule: FireModuleFactory<ExtendsModel, ExtendsAssets> | undefined
    protected readonly abstract modelParser: IWeaponModelParser<IWeaponModel>

    protected abstract CreateWeapon<T>(model: IWeaponModel, config: IWeaponConfig): any

    ParseModel(model: Model){
        this.buildData.WeaponModel = this.modelParser.Parse(model) as any
        return this
    }

    SetConfig(config: T & any){
        this.buildData.Config = config
        return this
    }

    SetFireModuleFactory(factory: FireModuleFactory<IWeaponModel, IWeaponAssets>) {
        this.createFireModule = factory
        return this
    }

    Build():T {
        const weaponModel = this.buildData.WeaponModel
        const config = this.buildData.Config
        if(!weaponModel || !config || !this.createFireModule)
            error(`Not inited parameters for ${script.Name}.Build()`)

        table.clear(this.buildData)
        return this.CreateWeapon(weaponModel, config)
    }
}