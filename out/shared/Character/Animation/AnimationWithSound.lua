-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReloadableAnimation = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "ReloadableAnimation").ReloadableAnimation
local AnimationWithSound
do
	local super = ReloadableAnimation
	AnimationWithSound = setmetatable({}, {
		__tostring = function()
			return "AnimationWithSound"
		end,
		__index = super,
	})
	AnimationWithSound.__index = AnimationWithSound
	function AnimationWithSound.new(...)
		local self = setmetatable({}, AnimationWithSound)
		return self:constructor(...) or self
	end
	function AnimationWithSound:constructor(owner, animation, soundSet)
		super.constructor(self, owner, animation)
		self.animation = animation
		self.soundSet = soundSet
	end
	function AnimationWithSound:Laod()
		super.Laod(self)
		self.track.KeyframeReached:Connect(function(name)
			local _soundSet = self.soundSet
			local _name = name
			local _result = _soundSet[_name]
			if _result ~= nil then
				_result:Play()
			end
		end)
	end
end
return {
	AnimationWithSound = AnimationWithSound,
}
