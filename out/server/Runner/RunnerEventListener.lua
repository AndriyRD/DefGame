-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseEventListener = TS.import(script, game:GetService("ServerScriptService"), "TS", "Core", "EventSystem", "BaseEventListener").BaseEventListener
local RunnerStorageContainer = TS.import(script, game:GetService("ServerScriptService"), "TS", "Runner", "RunnerStorage").RunnerStorageContainer
local RunnerEventListener
do
	local super = BaseEventListener
	RunnerEventListener = setmetatable({}, {
		__tostring = function()
			return "RunnerEventListener"
		end,
		__index = super,
	})
	RunnerEventListener.__index = RunnerEventListener
	function RunnerEventListener.new(...)
		local self = setmetatable({}, RunnerEventListener)
		return self:constructor(...) or self
	end
	function RunnerEventListener:constructor()
		super.constructor(self)
		self.storage = RunnerStorageContainer.new()
		local _eventHandler = self.EventHandler
		local _arg1 = function(plr)
			return self:OnRun(plr)
		end
		_eventHandler.Run = _arg1
		local _eventHandler_1 = self.EventHandler
		local _arg1_1 = function(plr)
			return self:OnStop(plr)
		end
		_eventHandler_1.Stop = _arg1_1
	end
	function RunnerEventListener:GetId()
		return "Runner"
	end
	function RunnerEventListener:OnRun(player)
		self.storage:Get(player):Run()
	end
	function RunnerEventListener:OnStop(player)
		self.storage:Get(player):Stop()
	end
end
return {
	RunnerEventListener = RunnerEventListener,
}
