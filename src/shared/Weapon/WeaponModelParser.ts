import { ReplicatedStorage } from "@rbxts/services";
import { IWeaponModel } from "./WeaponModel/IWeaponModel";
const weaponDir = ReplicatedStorage.WaitForChild('Weapon')
const models = weaponDir.WaitForChild('Models') as Folder

export class WeaponModelParser {
    private static readonly PART_NAMES = {
        MUZZLE: 'Muzzle',
        CASING_SPAWN: 'CasingSpawn',
        MAGGAZINE: 'Mag'
    }
    
    static Parse(model: Model){
        const muzzle = model.WaitForChild(WeaponModelParser.PART_NAMES.MUZZLE) as BasePart
        if (!muzzle) error(`Not found muzzle-part in weapon: ${model}`)
        
        const casingSpawn = model.WaitForChild(WeaponModelParser.PART_NAMES.CASING_SPAWN) as BasePart
        const mag = model.WaitForChild(WeaponModelParser.PART_NAMES.MAGGAZINE) as BasePart

        const root = model.PrimaryPart as BasePart
        if (!root) error(`Not found PrimaryPart in weapon-model: ${model}`)

        return {
            CasingSpawn: casingSpawn,
            Muzzle: muzzle,
            Model: model,
            Magazine: mag
        } as IWeaponModel
    }

    ByOriginal(name: string){
        const origin = models.WaitForChild(name) as Model
        if (origin){
            return WeaponModelParser.Parse(origin.Clone())
        }
        else error(`Not found model for weapon: ${name}`)
    }
}