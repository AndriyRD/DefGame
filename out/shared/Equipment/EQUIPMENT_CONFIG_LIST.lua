-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BODY_PART_NAMES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BODY_PART_NAMES")
local EQUIPMENT_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EQUIPMENTS_TYPES").EQUIPMENT_TYPES
local EQUIPMENT_CONFIG_LIST = {}
local _object = {
	EquipmentType = EQUIPMENT_TYPES.WEAPON,
}
local _left = "Orientation"
local _object_1 = {}
local _left_1 = "Equip"
local _object_2 = {
	BodyPartName = BODY_PART_NAMES.MAIN.RIGHT_HAND,
}
local _left_2 = "Offset"
local _cFrame = CFrame.new(0, 0, 0)
local _arg0 = CFrame.Angles(0, 0, 0)
_object_2[_left_2] = _cFrame * _arg0
_object_1[_left_1] = _object_2
local _left_3 = "Unequip"
local _object_3 = {
	BodyPartName = BODY_PART_NAMES.R15.UPPER_TORSO,
}
local _left_4 = "Offset"
local _cFrame_1 = CFrame.new(0, 0, 0.8)
local _arg0_1 = CFrame.Angles(-1.46, -0.95, -1.56)
_object_3[_left_4] = _cFrame_1 * _arg0_1
_object_1[_left_3] = _object_3
_object[_left] = _object_1
_object.AnimationSet = {
	Run = "12814987255",
	Walk = "12814987255",
	Idle = "12814840588",
	Jump = nil,
}
_object.ActionAnimations = {
	Equip = {
		AnimationID = "",
		Sounds = {},
	},
	Uneqip = {
		AnimationID = "14182762219",
		Sounds = { {
			Name = "Bolt",
			ID = "6111897024",
		} },
	},
}
EQUIPMENT_CONFIG_LIST.AK47 = _object
-- EQUIPMENT_CONFIG_LIST.set('RocketLauncher', {
-- EquipmentType: EQUIPMENT_TYPES.WEAPON,
-- Orientation: {
-- Equip: {
-- BodyPartName: BODY_PART_NAMES.MAIN.RIGHT_HAND,
-- Offset: new CFrame(0,0,0).mul(CFrame.Angles(-1.57, 1.57, 0))
-- },
-- Unequip: {
-- BodyPartName: BODY_PART_NAMES.R15.UPPER_TORSO,
-- Offset: new CFrame( 0.8, 1.2, 0.6).mul(CFrame.Angles(2.7, 0.3, -0.56))
-- }
-- },
-- AnimationSet: {
-- Run: '12814987255',
-- Idle: '12814840588',
-- Walk: '12814987255',
-- Jump: undefined
-- }
-- })
return EQUIPMENT_CONFIG_LIST
