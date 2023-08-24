import { IAssetParser } from "./Asset/IAssetParser"
import { IWeaponAssets } from "./Asset/IWeaponAssets"
import { FireModule } from "./FireModule/FireModule"
import { IWeaponConfig } from "./WeaponConfigurations/IWeaponConfig"
import { WeaponDataObject } from "./WeaponDataObject"
import { IWeaponModel } from "./WeaponModel/IWeaponModel"
import { WeaponOwnerState } from "./WeaponOwnerState"
import { FireModuleFactory } from "./WeponBuilder/FireModuleFactoryType"

export abstract class Weapon<ConfigType extends IWeaponConfig, ModelType extends IWeaponModel, AssetsType extends IWeaponAssets>{
    readonly OwnerState: WeaponOwnerState
    readonly DataObject: WeaponDataObject<AssetsType>
    readonly fireModule: FireModule<ModelType, AssetsType>

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

    constructor(
        readonly WeaponModel: ModelType,
        protected readonly config: ConfigType,
        readonly createFireModule: FireModuleFactory<ModelType, AssetsType>,
        assetParser: IAssetParser<AssetsType>
    ){
            this.DataObject = new WeaponDataObject(this.WeaponModel, config, assetParser)
            this.OwnerState = new WeaponOwnerState()
            this.fireModule = createFireModule(WeaponModel, this.DataObject)
            this.OnCreate()
    }
}