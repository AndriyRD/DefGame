-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local TweenService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local TraceBeamTransparencyAnimation = TS.import(script, script.Parent.Parent, "Trace", "TraceBeamTransparencyAnimation").TraceBeamTransparencyAnimation
local BeamAnimation
do
	BeamAnimation = setmetatable({}, {
		__tostring = function()
			return "BeamAnimation"
		end,
	})
	BeamAnimation.__index = BeamAnimation
	function BeamAnimation.new(...)
		local self = setmetatable({}, BeamAnimation)
		return self:constructor(...) or self
	end
	function BeamAnimation:constructor()
		self.curveSizeRange = NumberRange.new(0, 10)
		self.random = Random.new(tick())
		self.beamTransparencyAnimation = TraceBeamTransparencyAnimation.new(nil, nil)
		self.tweenInfo = TweenInfo.new()
	end
	function BeamAnimation:GetMinCurveSize()
		return self.random:NextNumber(-self.curveSizeRange.Max, -self.curveSizeRange.Min)
	end
	function BeamAnimation:GetMaxCurveSize()
		return self.random:NextNumber(self.curveSizeRange.Min, self.curveSizeRange.Max)
	end
	function BeamAnimation:GetRandomCurveSizeValue()
		return self.random:NextNumber(self:GetMinCurveSize(), self:GetMaxCurveSize())
	end
	function BeamAnimation:SetTweenInfo(info)
		self.tweenInfo = info
		self.beamTransparencyAnimation:SetTweenInfo(info)
		return self
	end
	function BeamAnimation:Play(beam)
		local tween = TweenService:Create(beam, self.tweenInfo, {
			CurveSize0 = self:GetRandomCurveSizeValue(),
			CurveSize1 = self:GetRandomCurveSizeValue(),
		})
		tween:Play()
		self.beamTransparencyAnimation:Animate(beam, nil)
		return tween
	end
end
return {
	BeamAnimation = BeamAnimation,
}
