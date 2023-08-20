-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Weapon = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Weapon").Weapon
local BaseWeapon
do
	local super = Weapon
	BaseWeapon = setmetatable({}, {
		__tostring = function()
			return "BaseWeapon"
		end,
		__index = super,
	})
	BaseWeapon.__index = BaseWeapon
	function BaseWeapon.new(...)
		local self = setmetatable({}, BaseWeapon)
		return self:constructor(...) or self
	end
	function BaseWeapon:constructor(...)
		super.constructor(self, ...)
	end
	function BaseWeapon:OnRemoveOwner(plr)
	end
	function BaseWeapon:OnNewOwner(plr)
	end
	function BaseWeapon:Reload()
		self.DataObject.Ammo:Reload()
	end
end
return {
	BaseWeapon = BaseWeapon,
}
