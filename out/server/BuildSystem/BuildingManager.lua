-- Compiled with roblox-ts v2.1.0
local BuildingManager
do
	BuildingManager = setmetatable({}, {
		__tostring = function()
			return "BuildingManager"
		end,
	})
	BuildingManager.__index = BuildingManager
	function BuildingManager.new(...)
		local self = setmetatable({}, BuildingManager)
		return self:constructor(...) or self
	end
	function BuildingManager:constructor()
	end
end
return {
	BuildingManager = BuildingManager,
}
