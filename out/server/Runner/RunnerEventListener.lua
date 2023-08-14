-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunnerStorageContainer = TS.import(script, game:GetService("ServerScriptService"), "TS", "Runner", "RunnerStorage").RunnerStorageContainer
local RunnerEventListener
do
	RunnerEventListener = setmetatable({}, {
		__tostring = function()
			return "RunnerEventListener"
		end,
	})
	RunnerEventListener.__index = RunnerEventListener
	function RunnerEventListener.new(...)
		local self = setmetatable({}, RunnerEventListener)
		return self:constructor(...) or self
	end
	function RunnerEventListener:constructor()
		self.storage = RunnerStorageContainer.new()
		self.OnRun = function(player)
			self.storage:Get(player):Run()
		end
		self.OnStop = function(player)
			self.storage:Get(player):Stop()
		end
	end
	function RunnerEventListener:GetId()
		return "Runner"
	end
end
return {
	RunnerEventListener = RunnerEventListener,
}
