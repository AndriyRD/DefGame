import { BUILDING_TYPES } from "./BUILDING_TYPES"

export interface IBuilding {
    readonly Name: string
    readonly Model: Model
    readonly Owner: Player
    readonly Container: Model
    readonly Type: BUILDING_TYPES
    readonly ID: number
}