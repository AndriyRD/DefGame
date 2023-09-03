-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local TweenService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local TraceBeamTransparencyAnimation
do
	TraceBeamTransparencyAnimation = setmetatable({}, {
		__tostring = function()
			return "TraceBeamTransparencyAnimation"
		end,
	})
	TraceBeamTransparencyAnimation.__index = TraceBeamTransparencyAnimation
	function TraceBeamTransparencyAnimation.new(...)
		local self = setmetatable({}, TraceBeamTransparencyAnimation)
		return self:constructor(...) or self
	end
	function TraceBeamTransparencyAnimation:constructor(info, initValue)
		self.tweenInfo = if info then info else TweenInfo.new()
		self.initValue = if initValue ~= 0 and (initValue == initValue and initValue) then initValue else .1
	end
	function TraceBeamTransparencyAnimation:NewBufferValue(startVal)
		local nv = Instance.new("NumberValue")
		nv.Value = startVal
		return nv
	end
	function TraceBeamTransparencyAnimation:SetTweenInfo(info)
		self.tweenInfo = info
	end
	function TraceBeamTransparencyAnimation:Animate(beam, onCompleted)
		local bufferNumValue = self:NewBufferValue(self.initValue)
		local numChangeConnection = bufferNumValue:GetPropertyChangedSignal("Value"):Connect(function()
			beam.Transparency = NumberSequence.new(bufferNumValue.Value)
			return beam.Transparency
		end)
		local tween = TweenService:Create(bufferNumValue, self.tweenInfo, {
			Value = 1,
		})
		local tweenConnaction
		tweenConnaction = tween.Completed:Connect(function()
			numChangeConnection:Disconnect()
			numChangeConnection = nil
			tweenConnaction:Disconnect()
			tweenConnaction = nil
			if onCompleted then
				onCompleted()
			end
			beam:Destroy()
			bufferNumValue:Destroy()
		end)
		tween:Play()
		return tween
	end
end
return {
	TraceBeamTransparencyAnimation = TraceBeamTransparencyAnimation,
}
