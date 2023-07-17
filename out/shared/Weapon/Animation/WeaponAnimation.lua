-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local AnimationWithSound = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimationWithSound").AnimationWithSound
local BaseWeaponRelaodAnimation = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Animation", "BaseWeaponRelaodAnimation").BaseWeaponRelaodAnimation
local AnimationUtility = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnmationUtility").AnimationUtility
local WeaponAnimation
do
	WeaponAnimation = setmetatable({}, {
		__tostring = function()
			return "WeaponAnimation"
		end,
	})
	WeaponAnimation.__index = WeaponAnimation
	function WeaponAnimation.new(...)
		local self = setmetatable({}, WeaponAnimation)
		return self:constructor(...) or self
	end
	function WeaponAnimation:constructor(weapon)
		self.weapon = weapon
		self.reloadAnim = BaseWeaponRelaodAnimation.new(AnimationWithSound.new(self.weapon:GetOwner(), AnimationUtility:CreateByID(self.weapon:GetConfig().AnimationSet.Relaod), self.weapon:GetAssets().Sounds.Relaod), weapon:GetWeaponModel())
	end
	function WeaponAnimation:PlayReload()
		self.reloadAnim:Play()
	end
end
return {
	WeaponAnimation = WeaponAnimation,
}
