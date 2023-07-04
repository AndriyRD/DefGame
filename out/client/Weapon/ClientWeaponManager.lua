-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WEAPON_HANDLER_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WEAPON_HANDLER_TYPES").WEAPON_HANDLER_TYPES
local WeaponManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeaponManager").WeaponManager
local BaseFireHandler = TS.import(script, script.Parent, "Handlers", "Base", "ClientBaseFireHandler").BaseFireHandler
local BaseHitHandler = TS.import(script, script.Parent, "Handlers", "Base", "ClientBaseHitHandler").BaseHitHandler
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
	function ClientWeaponManager:constructor(...)
		super.constructor(self, ...)
	end
	function ClientWeaponManager:InitFactories()
		local list = {}
		local _bASE = WEAPON_HANDLER_TYPES.BASE
		local _arg1 = {
			CreateFireHandler = function(w, h)
				return BaseFireHandler.new(w, h)
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
	ClientWeaponManager = ClientWeaponManager,
}
