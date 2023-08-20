-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeaponManager").WeaponManager
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
		-- this.factories.set(WEAPON_HANDLER_TYPES, (model) => new BaseFireHandler())
	end
end
return {
	ClientWeaponManager = ClientWeaponManager,
}
