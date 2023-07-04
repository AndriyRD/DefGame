-- Compiled with roblox-ts v2.1.0
local AnimationConfig
do
	AnimationConfig = setmetatable({}, {
		__tostring = function()
			return "AnimationConfig"
		end,
	})
	AnimationConfig.__index = AnimationConfig
	function AnimationConfig.new(...)
		local self = setmetatable({}, AnimationConfig)
		return self:constructor(...) or self
	end
	function AnimationConfig:constructor()
	end
	AnimationConfig.ANIMATE_SCRIPT_NAME = "Animate"
	AnimationConfig.ANIMATION_ASSET_ID_PREFIX = "rbxassetid://"
	AnimationConfig.MIN_SPEED_FOR_RUN_ANIMATION = .15
	AnimationConfig.DEFAULT_ANIMATION_SET_LIST = {
		R16 = {
			Run = "913376220",
			Walk = "913402848",
			Jump = "507765000",
			Idle = "507766388",
		},
	}
end
return {
	AnimationConfig = AnimationConfig,
}
