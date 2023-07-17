-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseGameLoop = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BaseGameLoop").BaseGameLoop
local Stamina
do
	Stamina = setmetatable({}, {
		__tostring = function()
			return "Stamina"
		end,
	})
	Stamina.__index = Stamina
	function Stamina.new(...)
		local self = setmetatable({}, Stamina)
		return self:constructor(...) or self
	end
	function Stamina:constructor(maxValue, regenSpeed)
		self.maxValue = maxValue
		self.regenSpeed = regenSpeed
		self.loopHandler = BaseGameLoop.new()
		self.currentValue = 0
		self.enableRegenState = true
		self.loopHandler:AddTask("main", function()
			if self.enableRegenState then
				self:RegenStamina()
			else
				self:ConsuptionStamina()
			end
		end):StartAsync()
	end
	function Stamina:RegenStamina()
		if self.currentValue < self.maxValue then
			self.currentValue += 1
			if self.currentValue > self.maxValue then
				self.currentValue = self.maxValue
			end
		end
	end
	function Stamina:ConsuptionStamina()
		if self.currentValue > 0 then
			self.currentValue -= 1
			if self.currentValue < 0 then
				self.currentValue = 0
			end
		end
	end
	function Stamina:Dispose()
		self.loopHandler:Stop()
		self.loopHandler:ClearTaskList()
		self.currentValue = nil
		self.maxValue = nil
		self.loopHandler = nil
	end
	function Stamina:GetCurrentValue()
		return self
	end
	function Stamina:SetConsuptionMode(value)
		self.enableRegenState = value
	end
end
return {
	Stamina = Stamina,
}
