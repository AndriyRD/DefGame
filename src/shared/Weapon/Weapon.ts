import { IAssetParser } from "./Asset/IAssetParser"
import { IWeaponAssets } from "./Asset/IWeaponAssets"
import { FireModule } from "./FireModule/FireModule"
import { IWeaponConfig } from "./WeaponConfigurations/IWeaponConfig"
import { WeaponDataObject } from "./WeaponDataObject"
import { IWeaponModel } from "./WeaponModel/IWeaponModel"
import { WeaponOwnerState } from "./WeaponOwnerState"

export abstract class Weapon<ConfigType extends IWeaponConfig, ModelType extends IWeaponModel, AssetsType extends IWeaponAssets>{
    readonly OwnerState: WeaponOwnerState
    readonly DataObject: WeaponDataObject<AssetsType>

    protected abstract OnRemoveOwner(plr: Player): void

    protected abstract OnNewOwner(plr: Player): void

    OnCreate(){
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
        readonly fireModule: FireModule<ModelType, AssetsType>,
        assetParser: IAssetParser<AssetsType>
    ){
            this.DataObject = new WeaponDataObject(this.WeaponModel, config, assetParser)
            this.OwnerState = new WeaponOwnerState()
    }
}