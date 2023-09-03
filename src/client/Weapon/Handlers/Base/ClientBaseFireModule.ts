import { WeaponRayCasting } from "./WeaponRayCasting";
import { IHitHandler } from "shared/Weapon/FireModule/IHitHandler";
import { GlobalConfig } from "shared/GlobalConfig";
import { EntityStorageFactory } from "shared/Entity/EntityStorage/EntityStorageFactory";
import { BaseParticleSet } from "shared/ParticleEmitterSet/BaseParticleSet";
import { WeaponDataObject } from "shared/Weapon/WeaponDataObject";
import { FireModule } from "shared/Weapon/FireModule/FireModule";
import { BaseHitHandler } from "./ClientBaseHitHandler"
import { EntityStorage } from "shared/Entity/EntityStorage/EntityStorage";
import { IWeaponModel } from "shared/Weapon/WeaponModel/IWeaponModel";
import { IWeaponAssets } from "shared/Weapon/Asset/IWeaponAssets";
import { SmokeBulletTrace } from "./VisualEffects/Trace2/SmokeBulletTrace";
import { BulletTrace } from "./VisualEffects/Trace2/BulletTrace";

export class BaseFireModule extends FireModule<IWeaponModel, IWeaponAssets>{
    private entityStorage
    private readonly smokeParticleSet
    protected readonly bulletTrace
    protected readonly hitHandler: IHitHandler = new BaseHitHandler()

    private caster: WeaponRayCasting | undefined
    private readonly fireSound

    Dispose(){
        
    }

    OnChagneOwner(plr: Player){
        this.caster = new WeaponRayCasting(plr, this.weponModel.Model.GetInstance())
        this.entityStorage = EntityStorageFactory.CreateByOtherTeams(
            plr.Team as Team, 
            GlobalConfig.TAGS.DAMAGEBLE_ENTITY)
                .AutoRegisterMode(true)
        return super.OnChagneOwner(plr)
    }

    Fire() {
        const res = this.caster?.Cast()
        if (!res) return
        const rayRes = res.RaycastResult
        if (rayRes){
            this.hitHandler.OnHit(rayRes)
            const entityGetRes = this.entityStorage.GetEntityByDescendant(rayRes.Instance)

            if(entityGetRes.Result)
                this.hitHandler.OnHitEnity(entityGetRes.Entity!, rayRes)
            else
                this.hitHandler.OnHitPart(rayRes)
            this.bulletTrace.Fire(rayRes.Position)
        }
        else
            this.bulletTrace.Fire(res.EndPoint)

        this.fireSound.Play()
        this.smokeParticleSet.Emit()

        return this;
    }

    constructor(weaponData: WeaponDataObject<IWeaponAssets>, model: IWeaponModel){
        super(weaponData, model)
        this.bulletTrace = new BulletTrace(this.weponModel.Muzzle)
        this.fireSound = this.weaponData.Assets.Sounds.Fire
        this.smokeParticleSet = new BaseParticleSet(new Instance('Attachment', this.weponModel.Muzzle))
            .AddByOrigin(this.weaponData.Assets.Particles.FireSmoke[0], {EmitParticleCount: 5})
            .AddByOrigin(this.weaponData.Assets.Particles.FireSmoke[1], {EmitParticleCount: 10})
        this.entityStorage = (undefined as any) as EntityStorage
    }
}