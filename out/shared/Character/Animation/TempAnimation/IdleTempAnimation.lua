-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GetHumanoidSpeed = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "GetHumanoidSpeed")
local BaseTempAniamtino = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "TempAnimation", "BaseTempAniamtino").BaseTempAniamtino
local IdleTempAnimation
do
	local super = BaseTempAniamtino
	IdleTempAnimation = setmetatable({}, {
		__tostring = function()
			return "IdleTempAnimation"
		end,
		__index = super,
	})
	IdleTempAnimation.__index = IdleTempAnimation
	function IdleTempAnimation.new(...)
		local self = setmetatable({}, IdleTempAnimation)
		return self:constructor(...) or self
	end
	function IdleTempAnimation:constructor(...)
		super.constructor(self, ...)
	end
	function IdleTempAnimation:CanBreak()
		if GetHumanoidSpeed(self.hum) > 0.3 then
			return true
		end
		return false
	end
	function IdleTempAnimation:ContinueTrack()
		super.ContinueTrack(self)
		local moveConn
		moveConn = self.hum:GetPropertyChangedSignal("MoveDirection"):Connect(function()
			if self:CanBreak() then
				self:Break()
				moveConn:Disconnect()
			end
		end)
		local animChangeConn
		animChangeConn = self.animator.AnimationPlayed:Connect(function()
			self:Break()
			animChangeConn:Disconnect()
		end)
		return self
	end
end
return {
	IdleTempAnimation = IdleTempAnimation,
}
