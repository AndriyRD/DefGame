import { IPersonWeaponModel } from "../WeaponModel/IPersonWeaponModel";
import { IWeaponModelParser } from "./IWeaponModelParser";
import { WeaponModelParser } from "./WeaponModelParser";

export class PersonWeaponModelParser extends WeaponModelParser implements IWeaponModelParser<IPersonWeaponModel>{
    protected readonly magPartName = 'Mag'

    Parse(model: Model) {
        const mag = model.FindFirstChild(this.magPartName) as BasePart
        if(!mag) error(`Not found ${this.magPartName} in model: ${model}`)

        const res = super.Parse(model)
        return {
            CasingSpawn: res.CasingSpawn,
            Model: res.Model,
            Muzzle: res.Muzzle,
            Magazine: mag
        } as IPersonWeaponModel
    }
}