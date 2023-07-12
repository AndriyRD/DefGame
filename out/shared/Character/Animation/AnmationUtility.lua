-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local AnimationConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimationConfig").AnimationConfig
local AnimationUtility
do
	AnimationUtility = setmetatable({}, {
		__tostring = function()
			return "AnimationUtility"
		end,
	})
	AnimationUtility.__index = AnimationUtility
	function AnimationUtility.new(...)
		local self = setmetatable({}, AnimationUtility)
		return self:constructor(...) or self
	end
	function AnimationUtility:constructor()
	end
	function AnimationUtility:CreateByID(id)
		return self:CreateByURI(AnimationConfig.ANIMATION_ASSET_ID_PREFIX .. id)
	end
	function AnimationUtility:CreateByURI(uri)
		local anim = Instance.new("Animation")
		anim.AnimationId = uri
		return anim
	end
end
return {
	AnimationUtility = AnimationUtility,
}
