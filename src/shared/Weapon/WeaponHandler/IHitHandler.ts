import { IEntity } from "shared/Entity/IEntity"
import { IWeapon } from "../IWeapon"

export interface IHitHandler {
    OnHit(res: RaycastResult): void
    OnHitPart(res: RaycastResult): void
    OnHitEnity(entity: IEntity, res: RaycastResult): void
}