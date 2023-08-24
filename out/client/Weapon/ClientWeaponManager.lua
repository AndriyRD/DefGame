-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WEAPON_HANDLER_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WEAPON_HANDLER_TYPES").WEAPON_HANDLER_TYPES
local WeaponManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeaponManager").WeaponManager
local BaseFireModule = TS.import(script, script.Parent, "Handlers", "Base", "ClientBaseFireModule").BaseFireModule
local ClientWeaponManager
do
	local super = WeaponManager
	ClientWeaponManager = setmetatable({}, {
		__tostring = function()
			return "ClientWeaponManager"
		end,
		__index = super,
	})
	ClientWeaponManager.__index = ClientWeaponManager
	function ClientWeaponManager.new(...)
		local self = setmetatable({}, ClientWeaponManager)
		return self:constructor(...) or self
	end
	function ClientWeaponManager:constructor()
		super.constructor(self)
		local _factories = self.factories
		local _bASE = WEAPON_HANDLER_TYPES.BASE
		local _arg1 = function(m, d)
			return BaseFireModule.new(d, m)
		end
		_factories[_bASE] = _arg1
	end
end
return {
	ClientWeaponManager = ClientWeaponManager,
}
