import { Reflection } from "shared/Reflection";
import { IWeaponBuildData } from "./IWeaponBuildData";
import { IWeaponBuilder } from "./IWeaponBuilder";
import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { Weapon } from "../Weapon";
import { FireModuleFactory } from "./FireModuleFactoryType";
import { BaseWeapon } from "../Weapons/BaseWeapon";
import { WeaponModelParser } from "../ModelParsers/WeaponModelParser";
import { IWeaponAssets } from "../Asset/IWeaponAssets";
import { IAssetParser } from "../Asset/IAssetParser";

export class WeaponBuilder implements IWeaponBuilder<IWeaponConfig, IWeaponModel, IWeaponAssets>{
    protected readonly buildData = {} as IWeaponBuildData<IWeaponConfig, IWeaponModel>
    protected fireModuleFactory: FireModuleFactory<IWeaponModel, IWeaponAssets> | undefined
    protected assetsParser: IAssetParser<IWeaponAssets> | undefined
    protected modelParser = new WeaponModelParser()
    private classInstanceProps = Reflection.ConvertObjectToMap(this)

    protected ExistProp(propName: string){
        return this.classInstanceProps.get(propName) !== undefined
    }

    protected CanCreateBaseWeapon(){
        for (const item of this.classInstanceProps)
            if(!this.ExistProp(item[0]))
                return false
        return true
    }

    ParseModel(model: Model){
        this.buildData.WeaponModel = this.modelParser.Parse(model) as any
        return this
    }

    SetConfig(config: IWeaponConfig){
        this.buildData.Config = config
        return this
    }

    GetConfig(){
        return this.buildData.Config
    }

    SetFireModuleFactory(factory: FireModuleFactory<IWeaponModel, IWeaponAssets>) {
        this.fireModuleFactory = factory
        return this
    }

    SetWeaponParser(parser: IAssetParser<IWeaponAssets>){
        this.assetsParser = parser
        return this
    }

    Build(): Weapon<IWeaponConfig, IWeaponModel, IWeaponAssets> {
        const weaponModel = this.buildData.WeaponModel
        const config = this.buildData.Config

        if(!weaponModel || !config || !this.fireModuleFactory || !this.assetsParser)
            error(`Not inited parameters for ${script.Name}.Build()`)

        const weapon = new BaseWeapon<IWeaponConfig, IWeaponModel, IWeaponAssets>(
            weaponModel, 
            config, 
            this.fireModuleFactory(weaponModel),
            this.assetsParser)

        table.clear(this.buildData)
        return weapon
    }
}