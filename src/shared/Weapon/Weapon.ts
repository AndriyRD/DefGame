import { FireModule } from "./FireModule/FireModule"
import { IWeaponConfig } from "./WeaponConfigurations/IWeaponConfig"
import { WeaponDataObject } from "./WeaponDataObject"
import { IWeaponModel } from "./WeaponModel/IWeaponModel"
import { WeaponOwnerState } from "./WeaponOwnerState"

export abstract class Weapon<ConfigType extends IWeaponConfig, ModelType extends IWeaponModel>{
    readonly OwnerState: WeaponOwnerState
    readonly DataObject: WeaponDataObject

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
        readonly fireModule: FireModule<ModelType>
    ){
            this.DataObject = new WeaponDataObject(this.WeaponModel, config)
            this.OwnerState = new WeaponOwnerState()
    }
}