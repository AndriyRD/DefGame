import { Reflection } from "shared/Reflection"
import { AmmoContainer } from "./Ammo/AmmoContainer"
import { PersonWeaponAnimation } from "./Animation/PersonWeaponAnimation"
import { IWeaponAssets } from "./Asset/IWeaponAssets"
import { IWeaponConfig } from "./IWeaponConfig"
import { BaseWeapon } from "./BaseWeapon"
import { IWeaponModel } from "./WeaponModel/IWeaponModel"
import { FactoryMap } from "shared/FactoryMap_v2"
import { WEAPON_CLASSES } from "./WEAPON_CLASSES"
import { IWeapon } from "./IWeapon"

export class WeaponBuilder {
    private name: string | undefined
    private config: IWeaponConfig | undefined
    private assets: IWeaponAssets | undefined
    private owner: Player | undefined
    private model: IWeaponModel | undefined
    private ammonContainer: AmmoContainer | undefined
    private personAnimatinos: PersonWeaponAnimation | undefined
    private classInstanceProps = Reflection.ConvertObjectToMap(this)
    private factoreis = new FactoryMap<WEAPON_CLASSES, IWeapon, >()

    private ExistProp(propName: string){
        return this.classInstanceProps.get(propName) !== undefined
    }

    private CanCreateBaseWeapon(){
        for (const item of this.classInstanceProps)
            if(!this.ExistProp(item[0]))
                return false
        return true
    }

    private CanCreatePersonWeapon(){
        if(this.CanCreateBaseWeapon()){
            if(this.personAnimatinos)
                return true
        }
        return false
    }

    private CreateIfCan(){

    }

    SetOwner(plr: Player){
        this.owner = plr
        return this
    }

    SetName(name: string){
        this.name = name
        return this
    }

    SetModel(model: IWeaponModel){
        this.model = model
        return this
    }

    SetConfig(config: IWeaponConfig){
        this.config = config
        return this
    }

    SetAssets(assets: IWeaponAssets){
        this.assets = assets
        return this
    }

    SetPersonAnimations(animatins: PersonWeaponAnimation){
        this.personAnimatinos = animatins
        return this
    }

    SetAmmoContainer(ammoContainer: AmmoContainer){
        this.ammonContainer = ammoContainer
        return this
    }

    BuildBaseWeapon(){
        if(this.CanCreateBaseWeapon()){
            return new BaseWeapon(this.owner!, this.name!, this.model!,
                 this.config!, this.ammonContainer!)
        }
        error(`Not inited parameters in ${script.Name} for build weapon`)
    }

    BuildPersonWeapon(){
        
    }
}