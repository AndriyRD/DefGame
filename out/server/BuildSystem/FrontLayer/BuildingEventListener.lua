-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local BuildingEventListener
do
	BuildingEventListener = setmetatable({}, {
		__tostring = function()
			return "BuildingEventListener"
		end,
	})
	BuildingEventListener.__index = BuildingEventListener
	function BuildingEventListener.new(...)
		local self = setmetatable({}, BuildingEventListener)
		return self:constructor(...) or self
	end
	function BuildingEventListener:constructor()
		self.EventHandler = {}
		self.dir = ReplicatedStorage:WaitForChild("Build"):WaitForChild("Remote")
		local _eventHandler = self.EventHandler
		local _arg1 = function(p, id, cf)
			return self:OnBuild(p, id, cf)
		end
		_eventHandler.Build = _arg1
	end
	function BuildingEventListener:GetId()
		return "build"
	end
	function BuildingEventListener:GetEventDirecotry()
		return self.dir
	end
	function BuildingEventListener:OnBuild(plr, id, cf)
		print("Player: " .. (tostring(plr) .. (" wanna build: " .. id)))
	end
end
return {
	BuildingEventListener = BuildingEventListener,
}
