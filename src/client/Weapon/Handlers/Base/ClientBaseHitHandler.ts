import { IEntity } from "shared/Entity/IEntity";
import { IHitHandler } from "shared/Weapon/FireModule/IHitHandler";
import { BulletHit } from "./VisualEffects/HitEffect/BulletHit";
import { HitPackage } from "client/Weapon/HitBuffer/HitPackage";
import { RemoteProvider } from "shared/RemoteProvider";

export class BaseHitHandler implements IHitHandler {
    private readonly bulletHit
    private readonly dmg = 7
    private readonly hitPackage = new HitPackage(5, 2)
    private readonly sendHitPackegeEvent = RemoteProvider.GetForWeapon().HitPackage

    OnHit(res: RaycastResult): void {
    }

    OnHitPart(res: RaycastResult): void {
        this.bulletHit.Spawn(res.Instance, res.Position)
    }

    OnHitEnity(entity: IEntity, res: RaycastResult): void {
        entity.TakeDamage(this.dmg)
        this.hitPackage.Push({Damage: this.dmg, Instance: res.Instance})
    }

    constructor(){
        this.bulletHit = new BulletHit()
        // this.dmg = this.weapon.GetConfig().Damage
        this.hitPackage.OnReady.Event.Connect(() =>
            this.sendHitPackegeEvent.FireServer(this.hitPackage.GetResults()))
    }
}