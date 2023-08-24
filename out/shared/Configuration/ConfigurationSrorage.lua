-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Configuration = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Configuration", "Configuration").Configuration
local WEAPON_HANDLER_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WEAPON_HANDLER_TYPES").WEAPON_HANDLER_TYPES
local WEAPON_CLASSES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WEAPON_CLASSES").WEAPON_CLASSES
local ConfigurationSrorage
do
	ConfigurationSrorage = setmetatable({}, {
		__tostring = function()
			return "ConfigurationSrorage"
		end,
	})
	ConfigurationSrorage.__index = ConfigurationSrorage
	function ConfigurationSrorage.new(...)
		local self = setmetatable({}, ConfigurationSrorage)
		return self:constructor(...) or self
	end
	function ConfigurationSrorage:constructor()
	end
	ConfigurationSrorage.WeaponConfiguration = Configuration.new({
		AK47 = {
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
		},
		RocketLauncher = {
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
		},
		MachineGun = {
			Damage = 7,
			FireSpeed = 20,
			HandlerType = WEAPON_HANDLER_TYPES.BASE,
			AmmoConfig = {
				MagazineSize = 180,
				MaxAmmo = 180,
			},
			WeaponClass = WEAPON_CLASSES.DEFAULT,
		},
	})
end
return {
	ConfigurationSrorage = ConfigurationSrorage,
}
