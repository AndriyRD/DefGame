-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BuildingController = TS.import(script, game:GetService("ServerScriptService"), "TS", "BuildSystem", "BuildingController").BuildingController
local BaseBuildingController
do
	local super = BuildingController
	BaseBuildingController = setmetatable({}, {
		__tostring = function()
			return "BaseBuildingController"
		end,
		__index = super,
	})
	BaseBuildingController.__index = BaseBuildingController
	function BaseBuildingController.new(...)
		local self = setmetatable({}, BaseBuildingController)
		return self:constructor(...) or self
	end
	function BaseBuildingController:constructor(...)
		super.constructor(self, ...)
	end
	function BaseBuildingController:Startup()
		return self
	end
	function BaseBuildingController:Register(building)
		return super.Register(self, building)
	end
end
return {
	BaseBuildingController = BaseBuildingController,
}
