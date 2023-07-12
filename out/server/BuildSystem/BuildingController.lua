-- Compiled with roblox-ts v2.1.0
local BuildingController
do
	BuildingController = {}
	function BuildingController:constructor()
		self.buildingList = {}
	end
	function BuildingController:Register(building)
		local _buildingList = self.buildingList
		local _building = building
		table.insert(_buildingList, _building)
		return self
	end
end
return {
	BuildingController = BuildingController,
}
