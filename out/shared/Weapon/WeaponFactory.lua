-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WEAPON_CONFIG_LIST = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WEAPON_CONFIG_LIST")
local BaseWeapon = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "BaseWeapon").BaseWeapon
local WeaponModelParser = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeaponModelParser").WeaponModelParser
local AmmoContainer = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Ammo", "AmmoContainer").AmmoContainer
local modelParser = WeaponModelParser.new()
local WeaponFactory
do
	WeaponFactory = setmetatable({}, {
		__tostring = function()
			return "WeaponFactory"
		end,
	})
	WeaponFactory.__index = WeaponFactory
	function WeaponFactory.new(...)
		local self = setmetatable({}, WeaponFactory)
		return self:constructor(...) or self
	end
	function WeaponFactory:constructor()
	end
	function WeaponFactory:GetConfig(name)
		local _name = name
		local config = WEAPON_CONFIG_LIST[_name]
		if not config then
			error("Not found config for weapon: " .. name)
		end
		return config
	end
	function WeaponFactory:Create(owner, name)
		local config = self:GetConfig(name)
		return BaseWeapon.new(owner, name, modelParser:ByOriginal(name), config, AmmoContainer.new(config.AmmoConfig))
	end
	function WeaponFactory:CreateByModel(owner, model)
		local name = model.Name
		local config = self:GetConfig(name)
		return BaseWeapon.new(owner, name, modelParser:Parse(model), config, AmmoContainer.new(config.AmmoConfig))
	end
end
return {
	WeaponFactory = WeaponFactory,
}
