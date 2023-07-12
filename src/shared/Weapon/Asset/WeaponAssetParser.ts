import { ReplicatedStorage } from "@rbxts/services";
import { IWeaponAssets } from "./IWeaponAssets";
const weaponDir = ReplicatedStorage.WaitForChild('Weapon') as Folder

export class WeaponAssetParser {
    private static readonly ASSET_DIR = weaponDir.WaitForChild('Assets') as Folder
    private readonly options = {

    }

    static Parse(name: string){
        const dir = this.ASSET_DIR.WaitForChild(name) as Folder
        
        //TODO: Parse weapon assets
        return {
            Sounds: {
                Fire: new Instance('Sound'),
                Equip: new Map(),
                Unequip: new Map(),
                Relaod: new Map()
            }
        }
    }
}