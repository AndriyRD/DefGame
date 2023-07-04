import { IWeapon } from "shared/Weapon/IWeapon";
import { IFireHandler } from "shared/Weapon/WeaponHandler/IFireHandler";
import { WeaponRayCasting } from "./WeaponRayCasting";
import { IHitHandler } from "shared/Weapon/WeaponHandler/IHitHandler";
import { ParticleController } from "./VisualEffects/ParticleController";

export class BaseFireHandler implements IFireHandler{
    private readonly particleController = new ParticleController()
    private readonly muzzle
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
        const res = this.caster.Cast() as RaycastResult | undefined
        if (res){
            this.OnHit(res)
            this.particleController.Shot(this.muzzle.CFrame, res.Position)
        }
        else{

        }
        return this;
    }

    constructor(
        protected readonly weapon: IWeapon,
        protected readonly hitHandler: IHitHandler){
        this.caster = new WeaponRayCasting(weapon.GetOwner())
        this.muzzle = weapon.GetWeaponModel().Muzzle
    }
}