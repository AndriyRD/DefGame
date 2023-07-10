import { IEntity } from "shared/IEntity";
import { IWeapon } from "shared/Weapon/IWeapon";
import { IHitHandler } from "shared/Weapon/WeaponHandler/IHitHandler";

export class BaseHitHandler implements IHitHandler {
    OnHit(res: RaycastResult): void {
    }

    OnHitPart(res: RaycastResult): void {
    }

    OnHitEnity(entity: IEntity, res: RaycastResult): void {
    }

    constructor(private readonly weapon: IWeapon){}
}