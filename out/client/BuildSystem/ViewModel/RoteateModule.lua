-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local TweenService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local RotateModule
do
	RotateModule = setmetatable({}, {
		__tostring = function()
			return "RotateModule"
		end,
	})
	RotateModule.__index = RotateModule
	function RotateModule.new(...)
		local self = setmetatable({}, RotateModule)
		return self:constructor(...) or self
	end
	function RotateModule:constructor(model)
		self.model = model
		self.fullRotationTime = 1
		self.tweenInfo = TweenInfo.new(self.fullRotationTime)
		self.currentTween = nil
		self.ROATATION_ANGLE = {
			RIGHT = CFrame.Angles(math.pi * 2, 0, 0),
			LEFT = CFrame.Angles(-math.pi * 2, 0, 0),
		}
		self.root = model.PrimaryPart
	end
	function RotateModule:RotateTo(angle)
		return TweenService:Create(self.root, self.tweenInfo, {
			CFrame = angle,
		})
	end
	function RotateModule:SetRoot(model)
		self.root = model.PrimaryPart
		if not self.root then
			error("Not found PrimaryPart in model: " .. tostring(model))
		end
		return model
	end
	function RotateModule:CancelIfRotateion()
		if self.currentTween then
			self.currentTween:Cancel()
		end
	end
	function RotateModule:Rotateion(toRight)
		self:CancelIfRotateion()
		if toRight then
			self.currentTween = self:RotateTo(self.ROATATION_ANGLE.RIGHT)
		else
			self.currentTween = self:RotateTo(self.ROATATION_ANGLE.LEFT)
		end
		self.currentTween:Play()
	end
	function RotateModule:SetNewModel(model)
		self.model = self:SetRoot(model)
	end
end
return {
	RotateModule = RotateModule,
}
