-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local FactoryMap = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "FactoryMap").FactoryMap
local WEAPON_HANDLER_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WEAPON_HANDLER_TYPES").WEAPON_HANDLER_TYPES
local WeaponManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeaponManager").WeaponManager
local BaseFireHandler = TS.import(script, script.Parent, "Handlers", "Base", "ClientBaseFireHandler").BaseFireHandler
local BaseHitHandler = TS.import(script, script.Parent, "Handlers", "Base", "ClientBaseHitHandler").BaseHitHandler
local WeaponProvider
do
	WeaponProvider = setmetatable({}, {
		__tostring = function()
			return "WeaponProvider"
		end,
	})
	WeaponProvider.__index = WeaponProvider
	function WeaponProvider.new(...)
		local self = setmetatable({}, WeaponProvider)
		return self:constructor(...) or self
	end
	function WeaponProvider:constructor()
	end
	WeaponProvider.weaponManager = WeaponManager.new(FactoryMap.new():Set(WEAPON_HANDLER_TYPES.BASE, function()
		return {
			CreateFireHandler = function(weapon, hitHandler)
				return BaseFireHandler.new(weapon, hitHandler)
			end,
			CreateHitHandler = function(weapon)
				return BaseHitHandler.new(weapon)
			end,
		}
	end))
end
return {
	WeaponProvider = WeaponProvider,
}
