-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local BODY_PART_NAMES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BODY_PART_NAMES")
local RotatedUpperTorso
do
	RotatedUpperTorso = setmetatable({}, {
		__tostring = function()
			return "RotatedUpperTorso"
		end,
	})
	RotatedUpperTorso.__index = RotatedUpperTorso
	function RotatedUpperTorso.new(...)
		local self = setmetatable({}, RotatedUpperTorso)
		return self:constructor(...) or self
	end
	function RotatedUpperTorso:constructor(charatcer, mouse)
		self.charatcer = charatcer
		self.mouse = mouse
		self.upperTorso = charatcer:WaitForChild(BODY_PART_NAMES.R15.UPPER_TORSO)
		self.lowerTorso = charatcer:WaitForChild(BODY_PART_NAMES.R15.LOWER_TORSO)
		self.waist = self.upperTorso:WaitForChild(BODY_PART_NAMES.MOTORS_R15.WAIST)
		self.DEFAULT_OFFSET = self.waist.C0
	end
	function RotatedUpperTorso:OnUpdate()
		local defaultOffset = self.DEFAULT_OFFSET
		local worldDefaultOffset = self.lowerTorso.CFrame:ToWorldSpace(defaultOffset)
		local lookToMouseCF = CFrame.lookAt(worldDefaultOffset.Position, self.mouse.Hit.Position)
		self.waist.C0 = CFrame.fromMatrix(defaultOffset.Position, defaultOffset.XVector, lookToMouseCF.YVector, defaultOffset.ZVector)
	end
	function RotatedUpperTorso:Enable()
		local _result = self.connection
		if _result ~= nil then
			_result = _result.Connected
		end
		if _result then
			self.connection:Disconnect()
		end
		self.connection = RunService.Heartbeat:Connect(function()
			return self:OnUpdate()
		end)
		return self
	end
	function RotatedUpperTorso:Disable()
		if self.connection then
			self.connection:Disconnect()
		end
		return self
	end
	function RotatedUpperTorso:Dispose()
		warn("implamentation dispose")
	end
end
return {
	RotatedUpperTorso = RotatedUpperTorso,
}
