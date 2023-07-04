-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
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
	function ServerWeaponManager:constructor(...)
		super.constructor(self, ...)
	end
	function ServerWeaponManager:InitFactories()
		local list = {}
		local _bASE = WEAPON_HANDLER_TYPES.BASE
		local _arg1 = {
			CreateFireHandler = function(w)
				return BaseFireHandler.new(w)
			end,
			CreateHitHandler = function(w)
				return BaseHitHandler.new(w)
			end,
		}
		list[_bASE] = _arg1
		return list
	end
end
return {
	ServerWeaponManager = ServerWeaponManager,
}
