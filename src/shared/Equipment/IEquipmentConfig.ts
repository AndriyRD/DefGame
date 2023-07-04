import { IEquipmentOrientationData } from "./IEquipmentOrientationData"
import { EQUIPMENT_TYPES } from "./EQUIPMENTS_TYPES"
import { ICharatcerAnimationIDSet } from "shared/Character/Animation/ICharatcerAnimationIDSet"

export interface IEquipmentConfig {
    Orientation: {
		Equip: IEquipmentOrientationData,
		Unequip: IEquipmentOrientationData
	},
	AnimationSet: ICharatcerAnimationIDSet,
	EquipmentType: EQUIPMENT_TYPES
}