-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local RegenebleStat
do
	RegenebleStat = setmetatable({}, {
		__tostring = function()
			return "RegenebleStat"
		end,
	})
	RegenebleStat.__index = RegenebleStat
	function RegenebleStat.new(...)
		local self = setmetatable({}, RegenebleStat)
		return self:constructor(...) or self
	end
	function RegenebleStat:constructor(maxValue)
		self.maxValue = maxValue
		self.canNegetiveValue = true
		self.currentValue = 0
		self.Updated = Instance.new("BindableEvent")
		self.currentValue = maxValue
	end
	function RegenebleStat:EnableRegen()
		if self.connection then
			self:DisableRegen()
		end
		self.connection = RunService.Heartbeat:Connect(function(dt)
			self.currentValue += math.clamp(self.currentValue + dt, 0, self.maxValue)
			return self.currentValue
		end)
		return self
	end
	function RegenebleStat:RegenPause(pauseTime)
		if self.connection and self.connection.Connected then
			coroutine.wrap(function()
				self:DisableRegen()
				task.wait(pauseTime)
				self:EnableRegen()
			end)()
		end
		return self
	end
	function RegenebleStat:DisableRegen()
		local _result = self.connection
		if _result ~= nil then
			_result:Disconnect()
		end
		self.connection = nil
		return self
	end
	function RegenebleStat:GetValue()
		return self.currentValue
	end
	function RegenebleStat:Update(update)
		self.currentValue = update(self.currentValue)
		if self.canNegetiveValue then
			self.currentValue = math.clamp(self.currentValue, 0, self.maxValue)
		end
		return self
	end
	function RegenebleStat:Dispose()
		self:DisableRegen()
		self.Updated:Destroy()
		table.clear(self)
	end
	function RegenebleStat:SetCanNegetiveValue(value)
		self.canNegetiveValue = value
		return self
	end
end
return {
	RegenebleStat = RegenebleStat,
}
