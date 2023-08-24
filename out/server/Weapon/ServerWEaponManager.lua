-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WEAPON_HANDLER_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WEAPON_HANDLER_TYPES").WEAPON_HANDLER_TYPES
local WeaponManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeaponManager").WeaponManager
local ServerBaseFireModule = TS.import(script, game:GetService("ServerScriptService"), "TS", "Weapon", "ServerWeaponHandlers", "Base", "ServerBaseFireModule").ServerBaseFireModule
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
		super.constructor(self)
		local _factories = self.factories
		local _bASE = WEAPON_HANDLER_TYPES.BASE
		local _arg1 = function(model, dataObj)
			return ServerBaseFireModule.new(dataObj, model)
		end
		_factories[_bASE] = _arg1
	end
end
return {
	ServerWeaponManager = ServerWeaponManager,
}
