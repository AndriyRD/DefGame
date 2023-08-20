import { Reflection } from "shared/Reflection";
import { IWeaponBuildData } from "./IWeaponBuildData";
import { IWeaponBuilder } from "./IWeaponBuilder";
import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { Weapon } from "../Weapon";
import { FireModuleFactory } from "./FireModuleFactoryType";
import { BaseWeapon } from "../Weapons/BaseWeapon";
import { WeaponModelParser } from "../ModelParsers/WeaponModelParser";
import WEAPON_CONFIG_LIST from "../WEAPON_CONFIG_LIST";

export class WeaponBuilder<T extends IWeaponBuildData> implements IWeaponBuilder<IWeaponConfig, IWeaponModel>{
    protected readonly buildData = {} as T 
    protected fireModuleFactory: FireModuleFactory<IWeaponModel> | undefined
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
        this.buildData.WeaponModel = this.modelParser.Parse(model)
        return this
    }

    SetConfig(config: IWeaponConfig){
        this.buildData.Config = config
        return this
    }

    GetConfig(){
        return this.buildData.Config
    }

    SetFireModuleFactory(factory: FireModuleFactory<IWeaponModel>) {
        this.fireModuleFactory = factory
        return this
    }

    Build(): Weapon<IWeaponConfig, IWeaponModel> {
        const weaponModel = this.buildData.WeaponModel
        const config = this.buildData.Config

        if(!weaponModel || !config || !this.fireModuleFactory)
            error(`Not inited parameters for ${script.Name}.Build()`)

        const weapon = new BaseWeapon(
            weaponModel, 
            config, 
            this.fireModuleFactory(weaponModel))

        table.clear(this.buildData)
        return weapon
    }
}