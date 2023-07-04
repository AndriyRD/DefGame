import { ReplicatedStorage } from "@rbxts/services";
import { IWeaponModel } from "./IWeaponModel";
const weaponDir = ReplicatedStorage.WaitForChild('Weapon')
const models = weaponDir.WaitForChild('Models') as Folder

export class WeaponModelParser {
    private readonly PART_NAMES = {
        MUZZLE: 'Muzzle',
        CASING_SPAWN: 'CasingSpawn'
    }
    
    Parse(model: Model){
        const muzzle = model.WaitForChild(this.PART_NAMES.MUZZLE) as BasePart
        if (!muzzle) error(`Not found muzzle-part in weapon: ${model}`)
        
        const casingSpawn = model.WaitForChild(this.PART_NAMES.CASING_SPAWN) as BasePart

        const root = model.PrimaryPart as BasePart
        if (!root) error(`Not found PrimaryPart in weapon-model: ${model}`)

        // const grip = root.WaitForChild(this.GRIP_POSTFIX) as Motor6D
        // if (!grip) error(`Not found grip in weapon-model: ${model}`)

        return {
            CasingSpawn: casingSpawn,
            Muzzle: muzzle,
            Model: model
        } as IWeaponModel
    }

    ByOriginal(name: string){
        const origin = models.WaitForChild(name) as Model
        if (origin){
            return this.Parse(origin.Clone())
        }
        else error(`Not found model for weapon: ${name}`)
    }
}