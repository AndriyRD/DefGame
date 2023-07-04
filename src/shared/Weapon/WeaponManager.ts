import { WeaponContainer } from "./WeaponContainer";
import { WeaponContainerFactory, WeaponHandlerFactoryList } from "./WeaponContainerFactory";

export abstract class WeaponManager {
    protected readonly weaponContainerFactory: WeaponContainerFactory
    protected readonly containerList = new Map<Player, WeaponContainer>
    private readonly factories: WeaponHandlerFactoryList

    protected abstract InitFactories(): WeaponHandlerFactoryList

    RegisterWeapon(plaeyr: Player, model: Model){
        const container = this.weaponContainerFactory.Create(plaeyr, model)
        this.containerList.set(plaeyr, container)
        return container
    }

    UnregisterWeapon(){
        //TODO: Clear from memory
    }

    constructor(){
        this.factories = this.InitFactories()
        this.weaponContainerFactory = new WeaponContainerFactory(this.factories)
    }
}