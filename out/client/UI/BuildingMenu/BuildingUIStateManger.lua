-- Compiled with roblox-ts v2.1.0
local BuildingUIStateManger
do
	BuildingUIStateManger = setmetatable({}, {
		__tostring = function()
			return "BuildingUIStateManger"
		end,
	})
	BuildingUIStateManger.__index = BuildingUIStateManger
	function BuildingUIStateManger.new(...)
		local self = setmetatable({}, BuildingUIStateManger)
		return self:constructor(...) or self
	end
	function BuildingUIStateManger:constructor()
	end
	BuildingUIStateManger.ChangeCategory = Instance.new("BindableEvent")
end
return {
	BuildingUIStateManger = BuildingUIStateManger,
}
