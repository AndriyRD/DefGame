import { WeaponRayCasting } from "./WeaponRayCasting";
import { IHitHandler } from "shared/Weapon/FireModule/IHitHandler";
import { ShotTrace } from "./VisualEffects/Trace/ShotTrace";
import { GlobalConfig } from "shared/GlobalConfig";
import { EntityStorageUnpacked } from "shared/Entity/EntityStorage/EntityStorageUnpacked";
import { EntityStorageFactory } from "shared/Entity/EntityStorage/EntityStorageFactory";
import { BaseParticleSet } from "shared/ParticleEmitterSet/BaseParticleSet";
import { WeaponDataObject } from "shared/Weapon/WeaponDataObject";
import { IPersonWeaponModel } from "shared/Weapon/WeaponModel/IPersonWeaponModel";
import { FireModule } from "shared/Weapon/FireModule/FireModule";
import { BaseHitHandler } from "./ClientBaseHitHandler"
import { IAssetParser } from "shared/Weapon/Asset/IAssetParser";
import { IWeaponAssets } from "shared/Weapon/Asset/IWeaponAssets";
import { IPersonWeaponAssets } from "shared/Weapon/Asset/IPersonWeaponAssets";

export class BaseFireHandler extends FireModule<IPersonWeaponModel, IPersonWeaponAssets>{
    private readonly entityStorage
    private readonly shotTrace
    private readonly smokeParticleSet
    protected readonly hitHandler: IHitHandler = new BaseHitHandler()

    private readonly caster
    private readonly fireSound

    Fire() {
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

    constructor(owner: Player, weaponData: WeaponDataObject<IPersonWeaponAssets>, model: IPersonWeaponModel){
        super(owner, weaponData, model)
        this.caster = new WeaponRayCasting(owner)
        this.shotTrace = new ShotTrace(this.weponModel)
        this.fireSound = this.weaponData.Assets.Sounds.Fire
        this.smokeParticleSet = new BaseParticleSet(new Instance('Attachment', this.weponModel.Muzzle))
            .AddByOrigin(this.weaponData.Assets.Particles.FireSmoke[0], {EmitParticleCount: 5})
            .AddByOrigin(this.weaponData.Assets.Particles.FireSmoke[1], {EmitParticleCount: 10})

        this.entityStorage = new EntityStorageUnpacked(
            EntityStorageFactory.CreateByOtherTeams(
                this.currentOwner.Team as Team, 
                GlobalConfig.TAGS.DAMAGEBLE_ENTITY)
                    .AutoRegisterMode(true))
    }
}