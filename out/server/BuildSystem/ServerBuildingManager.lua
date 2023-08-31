-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BUILDINGS_IDS = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "Building", "BUILDINGS_IDS").BUILDINGS_IDS
local BuildingManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "Building", "BuildingManager").BuildingManager
local FactoryMap = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "FactoryMap_v2").FactoryMap
local MachineGun = TS.import(script, game:GetService("ServerScriptService"), "TS", "BuildSystem", "Buildings", "ServerMachineGun").MachineGun
local Reflection = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Reflection").Reflection
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local Wall = TS.import(script, game:GetService("ServerScriptService"), "TS", "BuildSystem", "Buildings", "ServerWall").Wall
local IdentifiedInstance = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "IdentifiedInstance").IdentifiedInstance
local ServerBuildingManager
do
	local super = BuildingManager
	ServerBuildingManager = setmetatable({}, {
		__tostring = function()
			return "ServerBuildingManager"
		end,
		__index = super,
	})
	ServerBuildingManager.__index = ServerBuildingManager
	function ServerBuildingManager.new(...)
		local self = setmetatable({}, ServerBuildingManager)
		return self:constructor(...) or self
	end
	function ServerBuildingManager:constructor()
		super.constructor(self, FactoryMap.new():Set(BUILDINGS_IDS.MACHINE_GUN, function(v)
			return MachineGun.new(v)
		end):Set(BUILDINGS_IDS.BASE_WALL, function(v)
			return Wall.new(v)
		end))
	end
	function ServerBuildingManager:Build(id, cf)
		local createBuilding = self.factories:Find(id)
		if not createBuilding then
			error("Not found building by id: " .. id)
		end
		local buidlignModel = GlobalConfig.BUILDING_MODEL_STORAGE:WaitForChild(id)
		if not buidlignModel then
			error("Nor found model for buildnig: " .. id)
		end
		local model = IdentifiedInstance.new(buidlignModel:Clone())
		local building = createBuilding(model)
		local _buildings = self.buildings
		local _arg0 = model.GetInstance()
		_buildings[_arg0] = building
		building:OnBuild()
		return model
	end
	function ServerBuildingManager:UseAction(plr, model, actionName)
		local _exp = Reflection:ConvertObjectToMap(self:FindBuildingByModel(model))
		local _actionName = actionName
		local action = _exp[_actionName]
		if not action then
			error("Not found action: " .. (actionName .. (" for building: " .. tostring(model))))
		end
		action(plr)
		return self
	end
end
return {
	ServerBuildingManager = ServerBuildingManager,
}
