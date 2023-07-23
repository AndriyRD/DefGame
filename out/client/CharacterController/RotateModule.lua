-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
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
	function RotateModule:constructor(owner, character)
		self.owner = owner
		self.character = character
		self.connection = nil
		self.alignInstance = GlobalConfig.CHARACTER_ALIGHT_ISNTANCE:Clone()
		self.mouse = self.owner:GetMouse()
	end
	function RotateModule:GetTargetPoint(target)
		local pos = self.mouse.Hit.Position
		local lookVector = CFrame.lookAt(target.Position, pos)
		return CFrame.fromMatrix(target.Position, lookVector.XVector, target.CFrame.YVector, lookVector.ZVector)
	end
	function RotateModule:Enable()
		local root = self.character:GetRoot()
		local rootAttachment = self.character:GetRoot():WaitForChild("RootAttachment")
		self.alignInstance.Attachment0 = rootAttachment
		self.character:GetHumanoid().AutoRotate = false
		self.alignInstance.Enabled = true
		self.alignInstance.Parent = rootAttachment
		self.connection = RunService.Heartbeat:Connect(function()
			local _exp = self.alignInstance
			_exp.CFrame = self:GetTargetPoint(root)
			return _exp.CFrame
		end)
		return self
	end
	function RotateModule:Disable()
		self.alignInstance.Enabled = false
		local _result = self.connection
		if _result ~= nil then
			_result:Disconnect()
		end
	end
end
return {
	RotateModule = RotateModule,
}
