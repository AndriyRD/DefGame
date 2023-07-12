import { FactoryMap } from "shared/FactoryMap";
import { WeaponContainer } from "./WeaponContainer/WeaponContainer";
import { WeaponContainerFactory, WeaponHandlerFactory } from "./WeaponContainer/WeaponContainerFactory";
import { WEAPON_HANDLER_TYPES } from "./WEAPON_HANDLER_TYPES";

export class WeaponManager {
    protected readonly weaponContainerFactory: WeaponContainerFactory
    protected readonly containerList = new Map<Player, WeaponContainer>

    RegisterWeapon(plaeyr: Player, model: Model){
        const container = this.weaponContainerFactory.Create(plaeyr, model)
        this.containerList.set(plaeyr, container)
        return container
    }

    UnregisterWeapon(){
        //TODO: Clear from memory
    }

    constructor(private readonly handlerFactory: FactoryMap<WEAPON_HANDLER_TYPES, WeaponHandlerFactory>){
        this.weaponContainerFactory = new WeaponContainerFactory(this.handlerFactory)
    }
}