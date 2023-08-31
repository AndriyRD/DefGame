import { RunService } from "@rbxts/services"
import { IAssetParser } from "../Asset/IAssetParser"
import { IWeaponAssets } from "../Asset/IWeaponAssets"
import { FireModule } from "../FireModule/FireModule"
import { IWeapon } from "../IWeapon"
import { IWeaponConfig } from "../WeaponConfigurations/IWeaponConfig"
import { WeaponDataObject } from "../WeaponDataObject"
import { IWeaponModel } from "../WeaponModel/IWeaponModel"
import { WeaponOwnerState } from "../WeaponOwnerState"
import { FireModuleFactory } from "../WeponBuilder/FireModuleFactoryType"

export abstract class Weapon<ConfigType extends IWeaponConfig, ModelType extends IWeaponModel, AssetsType extends IWeaponAssets> implements IWeapon{
    protected readonly fireModule: FireModule<ModelType, AssetsType>
    private readonly id: string
    readonly OwnerState: WeaponOwnerState
    readonly DataObject: WeaponDataObject<AssetsType>

    protected OnRemoveOwner(plr: Player){
        this.fireModule.Dispose()
    }

    protected OnNewOwner(plr: Player){
        this.fireModule.OnChagneOwner(plr)
    }

    private OnCreate(){
        this.OwnerState.ChangeOwnerEvent.Event.Connect((oldPlr, newPlr) => {
            if(!newPlr && oldPlr)
                this.OnRemoveOwner(oldPlr)
            
            if(newPlr)
                this.OnNewOwner(newPlr)
        })

        return this
    }

    GetId(): string {
        return this.id
    }

    Fire(): void {
        if(this.fireModule.CanFire()){
            this.fireModule.Fire()
            this.DataObject.Ammo.GetMagazine().Take()
        }
    }

    constructor(
        readonly WeaponModel: ModelType,
        protected readonly config: ConfigType,
        readonly createFireModule: FireModuleFactory<ModelType, AssetsType>,
        assetParser: IAssetParser<AssetsType>
    ){
            this.id = WeaponModel.Model.Name
            this.DataObject = new WeaponDataObject(this.WeaponModel, config, assetParser)
            this.OwnerState = new WeaponOwnerState(this.id)
            this.fireModule = createFireModule(WeaponModel, this.DataObject)
            this.OnCreate()
    }
}