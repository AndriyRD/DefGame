-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GetHumanoidSpeed = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "GetHumanoidSpeed")
local RunTempAnimation = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "TempAnimation", "RunTempAnimation").RunTempAnimation
local AnimationConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimationConfig").AnimationConfig
local IdleTempAnimation = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "TempAnimation", "IdleTempAnimation").IdleTempAnimation
local AssetInstance = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "AssetInstance", "AssetInstance").AssetInstance
local TempAnimationController
do
	TempAnimationController = setmetatable({}, {
		__tostring = function()
			return "TempAnimationController"
		end,
	})
	TempAnimationController.__index = TempAnimationController
	function TempAnimationController.new(...)
		local self = setmetatable({}, TempAnimationController)
		return self:constructor(...) or self
	end
	function TempAnimationController:constructor(reloadableCharacter, animationIDSet)
		self.reloadableCharacter = reloadableCharacter
		self.animationIDSet = animationIDSet
	end
	function TempAnimationController:CraeteAnimationFromID(id)
		local anim = Instance.new("Animation")
		anim.AnimationId = AssetInstance.ASSET_URI_PREFIX .. id
		return anim
	end
	function TempAnimationController:Play()
		local hum = self.reloadableCharacter:GetHumanoid()
		local animator = self.reloadableCharacter:GetAnimator()
		if self.currentTempAnim then
			self.currentTempAnim:Break()
		end
		if GetHumanoidSpeed(hum) >= AnimationConfig.MIN_SPEED_FOR_RUN_ANIMATION then
			self.currentTempAnim = RunTempAnimation.new(animator, hum, {
				Run = self:CraeteAnimationFromID(self.animationIDSet.Run),
				Walk = self:CraeteAnimationFromID(self.animationIDSet.Walk),
			}):ContinueTrack()
		else
			self.currentTempAnim = IdleTempAnimation.new(animator, hum, self:CraeteAnimationFromID(self.animationIDSet.Idle)):ContinueTrack()
		end
	end
	function TempAnimationController:ChangeAnimationIDSet(newIDSet)
		self.animationIDSet = newIDSet
	end
end
return {
	TempAnimationController = TempAnimationController,
}
