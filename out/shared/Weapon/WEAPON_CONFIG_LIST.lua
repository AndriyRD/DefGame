-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WEAPON_HANDLER_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WEAPON_HANDLER_TYPES").WEAPON_HANDLER_TYPES
local WEAPON_CONFIG_LIST = {}
local _arg1 = {
	Damage = 7,
	FireSpeed = 7,
	HandlerType = WEAPON_HANDLER_TYPES.BASE,
	AmmoConfig = {
		MagazineSize = 30,
		MaxAmmo = 180,
	},
	AnimationSet = {
		Equip = "",
		Unequip = "",
		Relaod = "14044982295",
	},
}
WEAPON_CONFIG_LIST.AK47 = _arg1
return WEAPON_CONFIG_LIST
