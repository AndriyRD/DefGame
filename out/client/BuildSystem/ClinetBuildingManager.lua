-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BUILDINGS_IDS = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "Building", "BUILDINGS_IDS").BUILDINGS_IDS
local BuildingManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "Building", "BuildingManager").BuildingManager
local FactoryMap = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "FactoryMap_v2").FactoryMap
local MachineGun = TS.import(script, script.Parent, "Buildings", "MachineGun").MachineGun
local Wall = TS.import(script, script.Parent, "Buildings", "Wall").Wall
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
		super.constructor(self, FactoryMap.new():Set(BUILDINGS_IDS.MACHINE_GUN, function(m)
			return MachineGun.new(m)
		end):Set(BUILDINGS_IDS.BASE_WALL, function(m)
			return Wall.new(m)
		end))
	end
	function ClientBuildingManger:Build(model)
		local id = model.Name
		local createBuilding = self.factories:Find(id)
		if not createBuilding then
			error("Not found building by id: " .. tostring(id))
		end
		local building = createBuilding(model)
		local _buildings = self.buildings
		local _model = model
		_buildings[_model] = building
		return model
	end
end
return {
	ClientBuildingManger = ClientBuildingManger,
}
