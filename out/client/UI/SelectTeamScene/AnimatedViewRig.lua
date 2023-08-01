-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local TweenService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local AnimatedViewRig
do
	AnimatedViewRig = setmetatable({}, {
		__tostring = function()
			return "AnimatedViewRig"
		end,
	})
	AnimatedViewRig.__index = AnimatedViewRig
	function AnimatedViewRig.new(...)
		local self = setmetatable({}, AnimatedViewRig)
		return self:constructor(...) or self
	end
	function AnimatedViewRig:constructor(rig, tweenInfo)
		self.rig = rig
		self.tweenInfo = tweenInfo
		self.originPartPositions = {}
		self:ParsePositions()
	end
	function AnimatedViewRig:GetRigTweenPosition(part, offset)
		local _originPartPositions = self.originPartPositions
		local _part = part
		local _exp = _originPartPositions[_part]
		local _offset = offset
		return _exp + _offset
	end
	function AnimatedViewRig:TweenPosition(offset)
		for _, part in self.rig:GetDescendants() do
			if part:IsA("BasePart") then
				TweenService:Create(part, self.tweenInfo, {
					Position = self:GetRigTweenPosition(part, offset),
				}):Play()
			end
		end
	end
	function AnimatedViewRig:TweenToOffset(offset)
		self:TweenPosition(offset)
	end
	function AnimatedViewRig:ResetPosition()
		for _, part in self.rig:GetDescendants() do
			if part:IsA("BasePart") then
				TweenService:Create(part, self.tweenInfo, {
					Position = self.originPartPositions[part],
				}):Play()
			end
		end
	end
	function AnimatedViewRig:ParsePositions()
		for _, item in self.rig:GetDescendants() do
			if item:IsA("BasePart") then
				local _originPartPositions = self.originPartPositions
				local _position = item.Position
				_originPartPositions[item] = _position
			end
		end
	end
end
return {
	AnimatedViewRig = AnimatedViewRig,
}
