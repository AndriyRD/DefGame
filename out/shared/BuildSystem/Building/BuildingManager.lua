-- Compiled with roblox-ts v2.1.0
local BuildingManager
do
	BuildingManager = {}
	function BuildingManager:constructor(factories)
		self.factories = factories
		self.buildings = {}
	end
	function BuildingManager:FindBuildingByModel(model)
		local _buildings = self.buildings
		local _model = model
		local building = _buildings[_model]
		if not building then
			error("Not found buildng in manager")
		end
		return building
	end
	function BuildingManager:Destroy()
		-- TODO: Destroy building
		warn()
	end
end
return {
	BuildingManager = BuildingManager,
}
