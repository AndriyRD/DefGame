-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local CharacterAnimationIdSetToMap = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "CharacterAnimationIdSetToMap")
local ReloadableCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "ReloadableCharacter").ReloadableCharacter
local AnimationConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimationConfig").AnimationConfig
local TempAnimationController = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "TempAnimation", "TempAnimationController").TempAnimationController
local AnimatedCharacter
do
	AnimatedCharacter = setmetatable({}, {
		__tostring = function()
			return "AnimatedCharacter"
		end,
	})
	AnimatedCharacter.__index = AnimatedCharacter
	function AnimatedCharacter.new(...)
		local self = setmetatable({}, AnimatedCharacter)
		return self:constructor(...) or self
	end
	function AnimatedCharacter:constructor(owner, animationIDSet, defaultAnimationIDSet)
		self.owner = owner
		self.animationIDSet = animationIDSet
		self.defaultAnimationIDSet = defaultAnimationIDSet
		self.reloadableCharacter = ReloadableCharacter.new(owner)
		self.tempAnimationController = TempAnimationController.new(self.reloadableCharacter, self.animationIDSet)
	end
	function AnimatedCharacter:GetContainerName(originName)
		return string.lower(originName)
	end
	function AnimatedCharacter:GetCharacterAnimationContainer(name)
		local container = self.reloadableCharacter:GetAnimateScript():WaitForChild(self:GetContainerName(name))
		if not container then
			error("Not fund character animation-container: " .. name)
		end
		return container
	end
	function AnimatedCharacter:ChangeAnimationsInContainer(container, id)
		for _, element in container:GetChildren() do
			if element:IsA("Animation") then
				element.AnimationId = AnimationConfig.ANIMATION_ASSET_ID_PREFIX .. id
			end
		end
	end
	function AnimatedCharacter:SetAnimationId(name, id)
		local container = self:GetCharacterAnimationContainer(name)
		self:ChangeAnimationsInContainer(container, id)
	end
	function AnimatedCharacter:SetAnimatinos(idList)
		for _k, _v in idList do
			local e = { _k, _v }
			local name = e[1]
			local id = e[2]
			self:SetAnimationId(name, id)
		end
		self.tempAnimationController:Play()
	end
	function AnimatedCharacter:Load()
		self.tempAnimationController:ChangeAnimationIDSet(self.animationIDSet)
		self:SetAnimatinos(CharacterAnimationIdSetToMap(self.animationIDSet))
	end
	function AnimatedCharacter:Reset()
		self.tempAnimationController:ChangeAnimationIDSet(self.defaultAnimationIDSet)
		self:SetAnimatinos(CharacterAnimationIdSetToMap(self.defaultAnimationIDSet))
	end
end
return {
	AnimatedCharacter = AnimatedCharacter,
}
