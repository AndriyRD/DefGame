-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local RunService = _services.RunService
local Workspace = _services.Workspace
local CharatcerRaycaster = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "CharatcerRaycaster").CharatcerRaycaster
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local CoverDatector
do
	local super = CharatcerRaycaster
	CoverDatector = setmetatable({}, {
		__tostring = function()
			return "CoverDatector"
		end,
		__index = super,
	})
	CoverDatector.__index = CoverDatector
	function CoverDatector.new(...)
		local self = setmetatable({}, CoverDatector)
		return self:constructor(...) or self
	end
	function CoverDatector:constructor(character)
		super.constructor(self, character, { GlobalConfig.DEBRIS })
		self.character = character
		self.distance = 2.75
		self.OnDetect = Instance.new("BindableEvent")
	end
	function CoverDatector:Cast()
		local _fn = Workspace
		local _exp = self.root.Position
		local _lookVector = self.root.CFrame.LookVector
		local _distance = self.distance
		return _fn:Raycast(_exp, _lookVector * _distance, self.rayParams)
	end
	function CoverDatector:SetDistance(value)
		self.distance = value
		return self
	end
	function CoverDatector:StartDetectMode()
		self.connection = RunService.Heartbeat:Connect(function()
			local res = self:Cast()
			if res then
				self.OnDetect:Fire(res)
				local _result = self.connection
				if _result ~= nil then
					_result:Disconnect()
				end
			end
		end)
	end
end
return {
	CoverDatector = CoverDatector,
}
