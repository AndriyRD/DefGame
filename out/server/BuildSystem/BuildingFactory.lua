-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local models = ReplicatedStorage:WaitForChild("Build"):WaitForChild("Models")
local BuildingFactory
do
	BuildingFactory = setmetatable({}, {
		__tostring = function()
			return "BuildingFactory"
		end,
	})
	BuildingFactory.__index = BuildingFactory
	function BuildingFactory.new(...)
		local self = setmetatable({}, BuildingFactory)
		return self:constructor(...) or self
	end
	function BuildingFactory:constructor()
	end
	function BuildingFactory:Create(owner, name)
		local originModel = models:WaitForChild(name)
		if not originModel then
			error("Not found model for building: " .. name)
		end
		local building = {}
	end
end
return {
	BuildingFactory = BuildingFactory,
}
