-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WEAPON_HANDLER_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WEAPON_HANDLER_TYPES").WEAPON_HANDLER_TYPES
local WEAPON_CLASSES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WEAPON_CLASSES").WEAPON_CLASSES
local WEAPON_CONFIG_LIST = {}
local _arg1 = {
	Damage = 7,
	FireSpeed = 7,
	HandlerType = WEAPON_HANDLER_TYPES.BASE,
	AmmoConfig = {
		MagazineSize = 30,
		MaxAmmo = 180,
	},
	WeaponClass = WEAPON_CLASSES.PERSON_WEAPOM,
	AnimationSet = {
		Equip = "",
		Unequip = "",
		Relaod = "14110068229",
	},
}
WEAPON_CONFIG_LIST.AK47 = _arg1
local _arg1_1 = {
	Damage = 110,
	FireSpeed = 2,
	HandlerType = WEAPON_HANDLER_TYPES.BASE,
	AmmoConfig = {
		MagazineSize = 1,
		MaxAmmo = 10,
	},
	WeaponClass = WEAPON_CLASSES.PERSON_WEAPOM,
	AnimationSet = {
		Equip = "",
		Unequip = "",
		Relaod = "14085080526",
	},
}
WEAPON_CONFIG_LIST.RocketLauncher = _arg1_1
local _arg1_2 = {
	Damage = 7,
	FireSpeed = 20,
	HandlerType = WEAPON_HANDLER_TYPES.BASE,
	AmmoConfig = {
		MagazineSize = 180,
		MaxAmmo = 180,
	},
	WeaponClass = WEAPON_CLASSES.DEFAULT,
}
WEAPON_CONFIG_LIST.MachineGun = _arg1_2
return WEAPON_CONFIG_LIST
