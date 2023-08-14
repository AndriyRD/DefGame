-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Workspace = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local ServerBuildingManager = TS.import(script, game:GetService("ServerScriptService"), "TS", "BuildSystem", "ServerBuildingManager").ServerBuildingManager
local CanBuild = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "CanBuild")
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
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
		self.buildManger = ServerBuildingManager.new()
		self.modelContaiener = Workspace
		self.buildBuildingEvent = RemoteProvider:GetForBuild().Build
		self.OnBuild = function(plr, id, cf)
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
	function BuildingEventListener:GetId()
		return "Build"
	end
	function BuildingEventListener:GetModel(id)
		return GlobalConfig.BUILDING_MODEL_STORAGE:FindFirstChild(id)
	end
end
return {
	BuildingEventListener = BuildingEventListener,
}
