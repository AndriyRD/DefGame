-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local WeaponAnimation = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Animation", "WeaponAnimation").WeaponAnimation
local BaseWeapon = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "BaseWeapon").BaseWeapon
local PersonWeapon
do
	local super = BaseWeapon
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
	function PersonWeapon:constructor(owner, name, model, config, ammo)
		super.constructor(self, owner, name, model, config, ammo)
		self.animation = WeaponAnimation.new(self)
	end
	function PersonWeapon:Relaod()
		if RunService:IsClient() then
			self.animation:PlayReload()
		end
		return super.Relaod(self)
	end
end
return {
	PersonWeapon = PersonWeapon,
}
