-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseGameLoop = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Loop", "BaseGameLoop").BaseGameLoop
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
		self.loopHandler = BaseGameLoop.new():SetTickRate(1 / 20)
		self.ROATATION_ANGLE = {
			RIGHT = CFrame.Angles(0, math.rad(10), 0),
			LEFT = CFrame.Angles(0, math.rad(-10), 0),
		}
	end
	function RotateModule:RotateTo(angle)
		local _fn = self.model
		local _exp = self.model:GetPivot()
		local _angle = angle
		_fn:PivotTo(_exp * _angle)
	end
	function RotateModule:StartRotation(angle)
		self.loopHandler:AddTask("main", function()
			return self:RotateTo(angle)
		end):StartAsync()
	end
	function RotateModule:CancelIfRotateion()
		self.loopHandler:Stop():ClearTaskList()
	end
	function RotateModule:Rotation(toRight)
		self:CancelIfRotateion()
		if toRight then
			self:StartRotation(self.ROATATION_ANGLE.RIGHT)
		else
			self:StartRotation(self.ROATATION_ANGLE.LEFT)
		end
	end
	function RotateModule:SetNewModel(model)
		self.model = model
	end
end
return {
	RotateModule = RotateModule,
}
