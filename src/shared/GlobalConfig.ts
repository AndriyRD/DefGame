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
            },

            Reload: {
                Action: 'WeaponReloadAction',
                PC: {
                    Input: Enum.KeyCode.R
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
        },

        Run: {
            Action: 'RunAction',
            Input: {
                PC: Enum.KeyCode.LeftShift
            }
        }
    }

    static REPLICATE_PACKAGES_ID = {
        FIRE: 'Fire'
    }
    
    static SHELTER = {
        IDLE_ANIMATION_ID: '14134513942',
        HIDE_ANIMATION_ID: '14134503194'
    }

    static ATTRIBUTES_NAMES = {
        GAME_MODE: 'GameMode',
        IS_STARTING_GAME: 'IsStarting'
    }

    static MAP_MODEL_STORAGE = ReplicatedStorage.WaitForChild('Maps')
    static BUILDING_MODEL_STORAGE = ReplicatedStorage.WaitForChild('Build').WaitForChild('Models')
    static MAP_TERRAIN_CONTAINER_NAME = 'Tarrain'
    static LAODED_MAP_NAME = 'Map'
    static HP_ATTRIBUtE_NAME = 'HP'
    static UI_MAIN_SCREEN_NAME = 'MainUI'
}