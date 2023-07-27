-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Workspace = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local BaseEventListener = TS.import(script, game:GetService("ServerScriptService"), "TS", "Core", "EventSystem", "BaseEventListener").BaseEventListener
local ServerBuildingManager = TS.import(script, game:GetService("ServerScriptService"), "TS", "BuildSystem", "ServerBuildingManager").ServerBuildingManager
local CanBuild = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "CanBuild")
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local BuildingEventListener
do
	local super = BaseEventListener
	BuildingEventListener = setmetatable({}, {
		__tostring = function()
			return "BuildingEventListener"
		end,
		__index = super,
	})
	BuildingEventListener.__index = BuildingEventListener
	function BuildingEventListener.new(...)
		local self = setmetatable({}, BuildingEventListener)
		return self:constructor(...) or self
	end
	function BuildingEventListener:constructor()
		super.constructor(self)
		self.buildManger = ServerBuildingManager.new()
		self.modelContaiener = Workspace
		self.buildBuildingEvent = RemoteProvider:GetForBuild().Build
		local _eventHandler = self.EventHandler
		local _arg1 = function(plr, id, cf)
			return self:OnBuild(plr, id, cf)
		end
		_eventHandler.Build = _arg1
	end
	function BuildingEventListener:GetId()
		return "Build"
	end
	function BuildingEventListener:GetModel(id)
		return GlobalConfig.BUILDING_MODEL_STORAGE:FindFirstChild(id)
	end
	function BuildingEventListener:OnBuild(plr, id, cf)
		local originModel = self:GetModel(id)
		local canBuild = CanBuild(originModel, cf)
		print(canBuild)
		if canBuild then
			local data = self.buildManger:Build(id, cf)
			data.Model.Parent = self.modelContaiener
			data.Model:PivotTo(cf)
			self.buildBuildingEvent:FireAllClients(data.Model)
		end
	end
end
return {
	BuildingEventListener = BuildingEventListener,
}
