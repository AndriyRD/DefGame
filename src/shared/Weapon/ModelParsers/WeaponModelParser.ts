import { ReplicatedStorage, RunService } from "@rbxts/services";
import { IWeaponModel } from "../WeaponModel/IWeaponModel";
import { IWeaponModelParser } from "./IWeaponModelParser";
import { IdentifiedInstance } from "shared/IdentifiedInstance";
const weaponDir = ReplicatedStorage.WaitForChild('Weapon')
const models = weaponDir.WaitForChild('Models') as Folder

export class WeaponModelParser implements IWeaponModelParser<IWeaponModel>{
    Parse(model: Model){
        let muzzle = model.WaitForChild('Muzzle') as BasePart
        if (!muzzle) error(`Not found muzzle-part in weapon: ${model}`)
        
        const casingSpawn = model.WaitForChild('CasingSpawn') as BasePart
        if (!casingSpawn) error(`Not found casing-spawn in weapon-model: ${model}`)

        const root = model.PrimaryPart as BasePart
        if (!root) error(`Not found PrimaryPart in weapon-model: ${model}`)

        let identifiedModel

        if(RunService.IsClient())
            identifiedModel = IdentifiedInstance.ParseFrom<Model>(model)
        else identifiedModel = new IdentifiedInstance<Model>(model)

        return {
            CasingSpawn: casingSpawn,
            Muzzle: muzzle,
            Model: identifiedModel,
        }
    }

    ByOriginal(name: string){
        const origin = models.WaitForChild(name) as Model
        if (origin)
            return this.Parse(origin.Clone())
        else error(`Not found model for weapon: ${name}`)
    }
}