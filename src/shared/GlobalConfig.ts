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
        },

        Build: {
            Cancel: {
                Action: 'CancleBuildAction',
                PC: {
                    Input: [Enum.KeyCode.T, Enum.UserInputType.MouseButton2]
                }
            },

            Build: {
                Action: 'BuildAction',
                PC: {
                    Input: Enum.UserInputType.MouseButton1
                }
            },

            Rotate: {
                Action: 'RotateBuildingAction',
                PC: {
                    Input: [Enum.KeyCode.R, Enum.KeyCode.Q]
                }
            }
        }
    }

    static REPLICATE_PACKAGES_ID = {
        FIRE: 'Fire'
    }

    static MAP_MODEL_STORAGE = ReplicatedStorage.WaitForChild('Maps')
    static BUILDING_MODEL_STORAGE = ReplicatedStorage.WaitForChild('Buildings')
    static MAP_TERRAIN_CONTAINER_NAME = 'Tarrain'
    static LAODED_MAP_NAME = 'Map'
}