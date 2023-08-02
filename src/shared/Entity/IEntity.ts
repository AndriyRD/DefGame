import { IEntityEvents } from "./IEntityEvents"

export interface IEntity {
    readonly Events: IEntityEvents
    GetModel(): Model
    TakeDamage(value: number): IEntity
}