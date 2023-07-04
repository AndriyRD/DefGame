import { IWeapon } from "./IWeapon";
import { WEAPON_HANDLER_TYPES } from "./WEAPON_HANDLER_TYPES";
import { WeaponContainer } from "./WeaponContainer";
import { WeaponFactory } from "./WeaponFactory";
import { IFireHandler } from "./WeaponHandler/IFireHandler";
import { IHitHandler } from "./WeaponHandler/IHitHandler";

export type WeaponHandlerFactory = {
    CreateFireHandler: (weapon: IWeapon, hitHandler: IHitHandler) => IFireHandler,
    CreateHitHandler: (weapon: IWeapon) => IHitHandler
}

export type WeaponHandlerFactoryList = Map<WEAPON_HANDLER_TYPES, WeaponHandlerFactory>

export class WeaponContainerFactory {
    private readonly weaponFactory = new WeaponFactory()
    
    Create(owner: Player, model: Model): WeaponContainer{
        const weapon = this.weaponFactory.CreateByModel(owner, model)
        const handlerFactory = this.factories.get(weapon.GetConfig().HandlerType)
        if (!handlerFactory)
            error(`Not found weapon handler-factory: (${weapon.GetName()})`)

        const hitHandler = handlerFactory.CreateHitHandler(weapon)
        return new WeaponContainer(
                weapon,
                handlerFactory.CreateFireHandler(weapon, hitHandler),
                hitHandler)
    }

    constructor(private readonly factories: WeaponHandlerFactoryList){
    }
}