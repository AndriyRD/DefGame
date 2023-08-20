import { IEntity } from "shared/Entity/IEntity";
import { IHitHandler } from "shared/Weapon/FireModule/IHitHandler";

export class BaseHitHandler implements IHitHandler {
    OnHit(res: RaycastResult): void {
        
    }
    OnHitPart(res: RaycastResult): void {

    }
    OnHitEnity(entity: IEntity, res: RaycastResult): void {

    }
}