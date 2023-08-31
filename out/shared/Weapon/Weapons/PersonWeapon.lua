-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local PersonWeaponAnimation = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Animation", "PersonWeaponAnimation").PersonWeaponAnimation
local PersonWeaponAssetParser = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Asset", "PersonWeaponAssetParser").PersonWeaponAssetParser
local Weapon = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Weapons", "Weapon").Weapon
local AutoFire = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "FireModule", "AutoFire").AutoFire
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
		self.OwnerState.ChangeOwnerEvent.Event:Connect(function(_, plr)
			if plr then
				self.animation = self:CreatePersonAnimation(plr)
			end
		end)
		self.autoFire = AutoFire.new(self.fireModule)
	end
	function PersonWeapon:CreatePersonAnimation(owner)
		return PersonWeaponAnimation.new(owner, self.config.AnimationSet, self.DataObject.Assets, self.WeaponModel)
	end
	function PersonWeapon:StartFire()
		self.autoFire:StartFire()
		return self
	end
	function PersonWeapon:StopFire()
		self.autoFire:StopFire()
		return self
	end
	function PersonWeapon:Reload()
		if RunService:IsClient() then
			local _result = self.animation
			if _result ~= nil then
				_result:PlayReload()
			end
		end
		self.DataObject.Ammo:Reload()
	end
end
return {
	PersonWeapon = PersonWeapon,
}
