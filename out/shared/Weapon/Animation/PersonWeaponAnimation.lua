-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local AnimationWithSound = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimationWithSound").AnimationWithSound
local BaseWeaponRelaodAnimation = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Animation", "BaseWeaponRelaodAnimation").BaseWeaponRelaodAnimation
local AssetInstance = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "AssetInstance", "AssetInstance").AssetInstance
local PersonWeaponAnimation
do
	PersonWeaponAnimation = setmetatable({}, {
		__tostring = function()
			return "PersonWeaponAnimation"
		end,
	})
	PersonWeaponAnimation.__index = PersonWeaponAnimation
	function PersonWeaponAnimation.new(...)
		local self = setmetatable({}, PersonWeaponAnimation)
		return self:constructor(...) or self
	end
	function PersonWeaponAnimation:constructor(owner, animationSet, assets, model)
		self.owner = owner
		self.animationSet = animationSet
		self.assets = assets
		self.model = model
		self.reloadAnim = BaseWeaponRelaodAnimation.new(AnimationWithSound.new(owner, AssetInstance:CreateByID(animationSet.Relaod, "Animation"), self.assets.Sounds.Reload), self.model)
	end
	function PersonWeaponAnimation:PlayReload()
		self.reloadAnim:Play()
	end
end
return {
	PersonWeaponAnimation = PersonWeaponAnimation,
}
