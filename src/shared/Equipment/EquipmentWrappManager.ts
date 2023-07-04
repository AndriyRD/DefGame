import { EQUIPMENT_TYPES } from "./EQUIPMENTS_TYPES";
import { IEquipment } from "./IEquipment";
import { BaseWrappedEquipment } from "./Wrappers/BaseWrappedEquipment";
import { IWrappedEquipment } from "./IWrappedEquipment";

type FactoryList = Map<EQUIPMENT_TYPES, (equipment: IEquipment) => IWrappedEquipment>

export class EquipmentWrappManager {
    private readonly factoryList: FactoryList = new Map()

    Wrap(equipment: IEquipment): IWrappedEquipment{
        const equipmentType = equipment.GetEquipmentType() 
        if (equipmentType === EQUIPMENT_TYPES.DEFAULT) 
            return new BaseWrappedEquipment(equipment)
        
        for (const item of this.factoryList) {
            const _type = item[0]
            const factory = item[1]

            if (_type === equipment.GetEquipmentType())
                return factory(equipment)
        }
        error(`Not found equipment-wrapper of type: ${equipment.GetEquipmentType()}`)
    }

    AddFactory(_type: EQUIPMENT_TYPES, factory: (equipment: IEquipment) => IWrappedEquipment){
        this.GetFactories().set(_type, factory)
        return this
    }

    GetFactories(){
        return this.factoryList
    }
}