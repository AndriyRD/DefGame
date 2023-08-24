-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local PersonWeaponAnimation = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Animation", "PersonWeaponAnimation").PersonWeaponAnimation
local PersonWeaponAssetParser = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Asset", "PersonWeaponAssetParser").PersonWeaponAssetParser
local Weapon = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Weapon").Weapon
local PersonWeapon
do
	local super = Weapon
	PersonWeapon = setmetatable({}, {
		__tostring = function()
			return "PersonWeapon"
		end,
		__index = super,
	})
	PersonWeapon.__index = PersonWeapon
	function PersonWeapon.new(...)
		local self = setmetatable({}, PersonWeapon)
		return self:constructor(...) or self
	end
	function PersonWeapon:constructor(model, config, createFireModule)
		super.constructor(self, model, config, createFireModule, PersonWeaponAssetParser.new())
		self.animation = PersonWeaponAnimation.new(self.OwnerState:GetCurrent(), self.config.AnimationSet, self.DataObject.Assets, self.WeaponModel)
	end
	function PersonWeapon:Reload()
		if RunService:IsClient() then
			self.animation:PlayReload()
		end
		-- return super.Reload()
	end
end
return {
	PersonWeapon = PersonWeapon,
}
