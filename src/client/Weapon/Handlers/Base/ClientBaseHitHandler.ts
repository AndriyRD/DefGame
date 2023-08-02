import { IEntity } from "shared/Entity/IEntity";
import { IWeapon } from "shared/Weapon/IWeapon";
import { IHitHandler } from "shared/Weapon/WeaponHandler/IHitHandler";
import { BulletHit } from "./VisualEffects/HitEffect/BulletHit";

export class BaseHitHandler implements IHitHandler {
    private readonly bulletHit
    private readonly dmg

    OnHit(res: RaycastResult): void {
    }

    OnHitPart(res: RaycastResult): void {
        this.bulletHit.Spawn(res.Instance, res.Position)
    }

    OnHitEnity(entity: IEntity, res: RaycastResult): void {
        entity.TakeDamage(this.dmg)
    }

    constructor(private readonly weapon: IWeapon){
        this.bulletHit = new BulletHit()
        this.dmg = this.weapon.GetConfig().Damage
    }
}