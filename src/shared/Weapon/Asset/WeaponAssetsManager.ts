import { IWeaponModel } from "../IWeaponModel";
import { IWeaponAssets } from "./IWeaponAssets";

export class WeaponAssets {
    
    Laod(){
        print(`Load assets ${this.weaponModel.Model}`)
    }

    FireSound(){

    }

    constructor(
        private readonly weaponModel: IWeaponModel,
        private readonly assets: IWeaponAssets
        ){
        
    }
}