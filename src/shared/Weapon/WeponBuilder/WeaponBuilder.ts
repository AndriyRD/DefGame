import { Weapon } from "../Weapon";
import { IWeaponBuildData } from "./IWeaponBuildData";
import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { FireModuleFactory } from "./FireModuleFactoryType";
import { IWeaponAssets } from "../Asset/IWeaponAssets";
import { IAssetParser } from "../Asset/IAssetParser";
import { IWeaponModelParser } from "../ModelParsers/IWeaponModelParser";

export abstract class WeaponBuilder<T extends IWeaponConfig, U extends IWeaponModel, K extends IWeaponAssets>{
    protected readonly buildData = {} as IWeaponBuildData<T, U>
    protected createFireModule: FireModuleFactory<U, K> | undefined
    protected readonly abstract assetsParser: IAssetParser<K> | undefined
    protected readonly abstract modelParser: IWeaponModelParser<U>

    protected abstract CreateWeapon<WeaponType extends Weapon<T, U, K>>(model: U, config: T, assetParser: IAssetParser<K> | undefined): any

    ParseModel(model: Model){
        this.buildData.WeaponModel = this.modelParser.Parse(model) as any
        return this
    }

    SetConfig(config: T){
        this.buildData.Config = config
        return this
    }

    SetFireModuleFactory(factory: FireModuleFactory<U, K>) {
        this.createFireModule = factory
        return this
    }

    Build<WeaponType extends Weapon<T, U, K>>(): WeaponType  {
        const weaponModel = this.buildData.WeaponModel
        const config = this.buildData.Config
        if(!weaponModel || !config || !this.createFireModule || !this.assetsParser)
            error(`Not inited parameters for ${script.Name}.Build()`)

        table.clear(this.buildData)
        return this.CreateWeapon(weaponModel, config, this.assetsParser)
    }
}