import { ReplicatedStorage, Workspace } from "@rbxts/services";

export class GlobalConfig {
    static DEBRIS = Workspace.WaitForChild('Debris') as Model
    static BIND_DATA = {
        Weapon: {
            Fire: {
                Action: 'WeaponFireAction',
                PC: {
                    Input: Enum.UserInputType.MouseButton1
                }
            }
        }
    }

    static REPLICATE_PACKAGES_ID = {
        FIRE: 'Fire'
    }

    static MAP_MODEL_STORAGE = ReplicatedStorage.WaitForChild('Maps')
}