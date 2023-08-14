import { IWeapon } from "shared/Weapon/IWeapon";
import { IFireHandler } from "shared/Weapon/WeaponHandler/IFireHandler";
import { WeaponRayCasting } from "./WeaponRayCasting";
import { IHitHandler } from "shared/Weapon/WeaponHandler/IHitHandler";
import { BulletHit } from "./VisualEffects/HitEffect/BulletHit";
import { ShotTrace } from "./VisualEffects/Trace/ShotTrace";
import { GlobalConfig } from "shared/GlobalConfig";
import { EntityStorageUnpacked } from "shared/Entity/EntityStorage/EntityStorageUnpacked";
import { EntityStorageFactory } from "shared/Entity/EntityStorage/EntityStorageFactory";
import { BaseParticleSet } from "shared/ParticleEmitterSet/BaseParticleSet";

export class BaseFireHandler implements IFireHandler{
    private readonly entityStorage
    private readonly shotTrace
    private readonly smokeParticleSet

    private readonly caster
    private readonly fireSound

    Fire(): IFireHandler {
        const res = this.caster.Cast()
        const rayRes = res.RaycastResult
        if (rayRes){
            this.hitHandler.OnHit(rayRes)
            const entityGetRes = this.entityStorage.GetEntityByDescendant(rayRes.Instance)

            if(entityGetRes.Result)
                this.hitHandler.OnHitEnity(entityGetRes.Entity!, rayRes)
            else
                this.hitHandler.OnHitPart(rayRes)
            
            this.shotTrace.Create(rayRes.Position)
        }
        else
            this.shotTrace.Create(res.EndPoint)
        this.fireSound.Play()
        this.smokeParticleSet.Emit()

        return this;
    }

    constructor(
        protected readonly weapon: IWeapon,
        protected readonly hitHandler: IHitHandler){
            this.caster = new WeaponRayCasting(weapon.GetOwner())
            this.shotTrace = new ShotTrace(this.weapon.GetWeaponModel())
            this.fireSound = this.weapon.GetAssets().Sounds.Fire
            this.smokeParticleSet = new BaseParticleSet(new Instance('Attachment', this.weapon.GetWeaponModel().Muzzle))
                .AddByOrigin(weapon.GetAssets().Particles.FireSmoke[0], {EmitParticleCount: 5})
                .AddByOrigin(weapon.GetAssets().Particles.FireSmoke[1], {EmitParticleCount: 10})

            this.entityStorage = new EntityStorageUnpacked(
                EntityStorageFactory.CreateByOtherTeams(
                    this.weapon.GetOwner().Team as Team, 
                    GlobalConfig.TAGS.DAMAGEBLE_ENTITY)
                        .AutoRegisterMode(true))
    }
}