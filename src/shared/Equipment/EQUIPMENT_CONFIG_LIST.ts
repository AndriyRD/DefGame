import BODY_PART_NAMES from "shared/BODY_PART_NAMES"
import { EQUIPMENT_TYPES } from "./EQUIPMENTS_TYPES"
import { IEquipmentConfig } from "./IEquipmentConfig"
const EQUIPMENT_CONFIG_LIST = new Map<string, IEquipmentConfig>()

EQUIPMENT_CONFIG_LIST.set('AK47', {
    EquipmentType: EQUIPMENT_TYPES.WEAPON,
		Orientation: {
			Equip: {
				BodyPartName: BODY_PART_NAMES.MAIN.RIGHT_HAND,
                Offset: new CFrame(0,0,0).mul(CFrame.Angles(0,0,0))
			},
			
			Unequip: {
				BodyPartName: BODY_PART_NAMES.R15.UPPER_TORSO,
				Offset: new CFrame(0, 0, 0.8).mul(CFrame.Angles(-1.46, -0.95, -1.56))
			}
		},
		AnimationSet: {
			Run: '12814987255',
			Walk: '12814987255',
			Idle: '12814840588',
			Jump: undefined
		},
		ActionAnimations: {
			Equip: {
				AnimationID: '',
				Sounds: [] as any
			},

			Uneqip: {
				AnimationID: '14182762219',
				Sounds: [
					{
						Name: 'Bolt',
						ID: '6111897024',
					}
				]
			},
		}
})

// EQUIPMENT_CONFIG_LIST.set('RocketLauncher', {
//     EquipmentType: EQUIPMENT_TYPES.WEAPON,
// 		Orientation: {
// 			Equip: {
// 				BodyPartName: BODY_PART_NAMES.MAIN.RIGHT_HAND,
// 				Offset: new CFrame(0,0,0).mul(CFrame.Angles(-1.57, 1.57, 0))
// 			},

// 			Unequip: {
// 				BodyPartName: BODY_PART_NAMES.R15.UPPER_TORSO,
// 				Offset: new CFrame( 0.8, 1.2, 0.6).mul(CFrame.Angles(2.7, 0.3, -0.56))
// 			}
// 		},
// 		AnimationSet: {
// 			Run: '12814987255',
// 			Idle: '12814840588',
// 			Walk: '12814987255',
// 			Jump: undefined
// 		}
// })

export = EQUIPMENT_CONFIG_LIST