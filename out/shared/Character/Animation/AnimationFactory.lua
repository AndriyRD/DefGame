-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local AssetInstance = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "AssetInstance", "AssetInstance").AssetInstance
local ReloadableAnimation = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "ReloadableAnimation").ReloadableAnimation
local AnimationWithSound = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimationWithSound").AnimationWithSound
local AnimationFactory
do
	AnimationFactory = setmetatable({}, {
		__tostring = function()
			return "AnimationFactory"
		end,
	})
	AnimationFactory.__index = AnimationFactory
	function AnimationFactory.new(...)
		local self = setmetatable({}, AnimationFactory)
		return self:constructor(...) or self
	end
	function AnimationFactory:constructor()
	end
	function AnimationFactory:CreateReloadebleByID(owner, id)
		return ReloadableAnimation.new(owner, AssetInstance:CreateByID(id, "Animation"))
	end
	function AnimationFactory:CraeteWithSoundByID(owner, id, soundSet)
		return AnimationWithSound.new(owner, AssetInstance:CreateByID(id, "Animation"), soundSet)
	end
end
return {
	AnimationFactory = AnimationFactory,
}
