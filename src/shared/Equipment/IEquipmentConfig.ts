import { IEquipmentOrientationData } from "./IEquipmentOrientationData"
import { EQUIPMENT_TYPES } from "./EQUIPMENTS_TYPES"
import { ICharatcerAnimationIDSet } from "shared/Character/Animation/ICharatcerAnimationIDSet"
import { IEquipmentActionAnimations } from "./Animation/IEquipmentActionAnimations"

export interface IEquipmentConfig {
    Orientation: {
		Equip: IEquipmentOrientationData
		Unequip: IEquipmentOrientationData
	},
	AnimationSet: ICharatcerAnimationIDSet
	ActionAnimations: IEquipmentActionAnimations
	EquipmentType: EQUIPMENT_TYPES
}