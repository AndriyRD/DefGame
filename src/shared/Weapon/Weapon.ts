import { IFireModule } from "./IFireModule"
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
        protected readonly WeaponModel: IWeaponModel,
        protected readonly config: IWeaponConfig,
        protected readonly fireModule: IFireModule
    ){
            this.DataObject = new WeaponDataObject(this.WeaponModel, config)
            this.OwnerState = new WeaponOwnerState()
    }
}