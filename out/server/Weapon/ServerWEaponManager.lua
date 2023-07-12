-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local FactoryMap = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "FactoryMap").FactoryMap
local WEAPON_HANDLER_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WEAPON_HANDLER_TYPES").WEAPON_HANDLER_TYPES
local WeaponManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeaponManager").WeaponManager
local BaseFireHandler = TS.import(script, game:GetService("ServerScriptService"), "TS", "Weapon", "ServerWeaponHandlers", "Base", "ServerBaseFireHandler").BaseFireHandler
local BaseHitHandler = TS.import(script, game:GetService("ServerScriptService"), "TS", "Weapon", "ServerWeaponHandlers", "Base", "ServerBaseHitHandler").BaseHitHandler
local ServerWeaponManager
do
	local super = WeaponManager
	ServerWeaponManager = setmetatable({}, {
		__tostring = function()
			return "ServerWeaponManager"
		end,
		__index = super,
	})
	ServerWeaponManager.__index = ServerWeaponManager
	function ServerWeaponManager.new(...)
		local self = setmetatable({}, ServerWeaponManager)
		return self:constructor(...) or self
	end
	function ServerWeaponManager:constructor()
		local factories = FactoryMap.new():Set(WEAPON_HANDLER_TYPES.BASE, function()
			return {
				CreateFireHandler = function(weapon)
					return BaseFireHandler.new(weapon)
				end,
				CreateHitHandler = function(weapon)
					return BaseHitHandler.new(weapon)
				end,
			}
		end)
		super.constructor(self, factories)
	end
end
return {
	ServerWeaponManager = ServerWeaponManager,
}
