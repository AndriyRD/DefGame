-- Compiled with roblox-ts v2.1.0
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
	end
end
return {
	BuildingEventListener = BuildingEventListener,
}
