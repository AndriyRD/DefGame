import { IEntity } from "shared/Entity/IEntity";
import { IWeapon } from "shared/Weapon/Weapon";
import { IHitHandler } from "shared/Weapon/WeaponHandler/IHitHandler";

export class BaseHitHandler implements IHitHandler {
    OnHit(res: RaycastResult): void {
        
    }
    OnHitPart(res: RaycastResult): void {

    }
    OnHitEnity(entity: IEntity, res: RaycastResult): void {

    }
    constructor(private readonly waepon: IWeapon){}

}