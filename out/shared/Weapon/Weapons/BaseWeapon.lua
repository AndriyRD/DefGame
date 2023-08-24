-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Weapon = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Weapon").Weapon
local WeaponAssetParser = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Asset", "WeaponAssetParser").WeaponAssetParser
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
	function BaseWeapon:constructor(model, config, createFireModule)
		super.constructor(self, model, config, createFireModule, WeaponAssetParser.new())
	end
	function BaseWeapon:Reload()
		self.DataObject.Ammo:Reload()
	end
end
return {
	BaseWeapon = BaseWeapon,
}
