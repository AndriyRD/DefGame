import { IWeapon } from "shared/Weapon/IWeapon";
import { IFireHandler } from "shared/Weapon/WeaponHandler/IFireHandler";
import { WeaponRayCasting } from "./WeaponRayCasting";
import { IHitHandler } from "shared/Weapon/WeaponHandler/IHitHandler";
import { BulletHit } from "./VisualEffects/HitEffect/BulletHit";
import { ShotTrace } from "./VisualEffects/Trace/ShotTrace";

export class BaseFireHandler implements IFireHandler{
    private readonly shotTrace
    private readonly bulletHit
    private readonly caster

    protected OnHit(res: RaycastResult){
        this.hitHandler.OnHit(res)
        const parent = res.Instance.Parent
        if (parent && parent.IsA('Model')){
            const hum = parent.FindFirstChildOfClass('Humanoid') as Humanoid
            if (hum){
                this.hitHandler.OnHitEnity({
                    Charatcer: parent,
                    Humanoid: hum
                }, res)
            }
            else {
                this.hitHandler.OnHitPart(res)
            }
        }
    }

    Fire(): IFireHandler {
        const res = this.caster.Cast()
        const rayRes = res.RaycastResult
        if (rayRes){
            this.OnHit(rayRes)
            coroutine.wrap(() => {
                this.shotTrace.Create(rayRes.Instance, rayRes.Position)
                this.bulletHit.Spawn(rayRes.Instance, rayRes.Position)
            })()
        }
        else{
            this.shotTrace.CreateWithoutParent(res.EndPoint)
        }
        return this;
    }

    constructor(
        protected readonly weapon: IWeapon,
        protected readonly hitHandler: IHitHandler){
        this.caster = new WeaponRayCasting(weapon.GetOwner())
        this.shotTrace = new ShotTrace(this.weapon.GetWeaponModel())
        this.bulletHit = new BulletHit()
    }
}