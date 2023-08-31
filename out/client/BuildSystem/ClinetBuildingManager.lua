-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BUILDINGS_IDS = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "Building", "BUILDINGS_IDS").BUILDINGS_IDS
local BuildingManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "Building", "BuildingManager").BuildingManager
local FactoryMap = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "FactoryMap_v2").FactoryMap
local MachineGun = TS.import(script, script.Parent, "Buildings", "MachineGun").MachineGun
local Wall = TS.import(script, script.Parent, "Buildings", "Wall").Wall
local InstanceCache = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "InstanceCache", "InstanceCache").InstanceCache
local Workspace = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local IdentifiedInstance = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "IdentifiedInstance").IdentifiedInstance
local ClientBuildingManger
do
	local super = BuildingManager
	ClientBuildingManger = setmetatable({}, {
		__tostring = function()
			return "ClientBuildingManger"
		end,
		__index = super,
	})
	ClientBuildingManger.__index = ClientBuildingManger
	function ClientBuildingManger.new(...)
		local self = setmetatable({}, ClientBuildingManger)
		return self:constructor(...) or self
	end
	function ClientBuildingManger:constructor()
		super.constructor(self, FactoryMap.new():Set(BUILDINGS_IDS.MACHINE_GUN, function(v)
			return MachineGun.new(v)
		end):Set(BUILDINGS_IDS.BASE_WALL, function(v)
			return Wall.new(v)
		end))
		self.modelContainer = Workspace
		self.buildingCache = InstanceCache.new():SetMaxLifeTime(2400)
	end
	function ClientBuildingManger:Build(globalID)
		local identifiedModel = IdentifiedInstance:FindAndWrap(globalID)
		local model = identifiedModel.GetInstance()
		if not model then
			error("Not found building model by global id: " .. tostring(globalID))
		end
		local id = model.Name
		local createBuilding = self.factories:Find(id)
		if not createBuilding then
			error("Not found building by id: " .. id)
		end
		local building = createBuilding(identifiedModel)
		self.buildings[model] = building
		return identifiedModel
	end
end
return {
	ClientBuildingManger = ClientBuildingManger,
}
