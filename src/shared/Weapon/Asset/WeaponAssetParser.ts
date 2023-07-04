import { ReplicatedStorage } from "@rbxts/services";
import { IWeaponAssets } from "./IWeaponAssets";
const weaponDir = ReplicatedStorage.WaitForChild('Weapon') as Folder

export class WeaponAssetParser {
    private readonly ASSET_DIR = weaponDir.WaitForChild('Assets') as Folder

    Parse(name: string){
        const dir = this.ASSET_DIR.WaitForChild(name) as Folder

        return {
            Sounds: {
                Fire: {}
            }
        } as IWeaponAssets
    }
}