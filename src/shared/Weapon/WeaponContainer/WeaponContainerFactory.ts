import { IWeapon } from "../Weapon";
import { WEAPON_HANDLER_TYPES } from "../WEAPON_HANDLER_TYPES";
import { WeaponContainer } from "./WeaponContainer";
import { WeaponFactory } from "../WeaponFactory";
import { IFireHandler } from "../WeaponHandler/IFireHandler";
import { IHitHandler } from "../WeaponHandler/IHitHandler";
import { FactoryMap } from "shared/FactoryMap";

export type WeaponHandlerFactory = {
    CreateFireHandler: (weapon: IWeapon, hitHandler: IHitHandler) => IFireHandler,
    CreateHitHandler: (weapon: IWeapon) => IHitHandler
}

export class WeaponContainerFactory {
    private readonly weaponFactory = new WeaponFactory()
    
    Create(owner: Player, model: Model): WeaponContainer{
        const weapon = this.weaponFactory.CreateByModel(owner, model)
        const handlers = this.factories.Find(weapon.GetConfig().HandlerType)!()
        if (!handlers)
            error(`Not found weapon handler-factory: (${weapon.GetName()})`)

        const hitHandler = handlers.CreateHitHandler(weapon)
        return new WeaponContainer(
                weapon,
                handlers.CreateFireHandler(weapon, hitHandler),
                hitHandler)
    }

    constructor(private readonly factories: FactoryMap<WEAPON_HANDLER_TYPES, WeaponHandlerFactory>){
    }
}