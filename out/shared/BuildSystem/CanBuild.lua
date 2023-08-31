-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Workspace = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local map = nil
local tarrain = nil
local params = OverlapParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude
params.FilterDescendantsInstances = {}
local baseplate = Workspace:WaitForChild("Baseplate")
return function(build, cf)
	-- if(!map || !map.Parent)
	-- map = Workspace.WaitForChild(GlobalConfig.LAODED_MAP_NAME) as Model
	-- if(!tarrain || !tarrain.Parent)
	-- tarrain = map.WaitForChild(GlobalConfig.MAP_TERRAIN_CONTAINER_NAME) as Model
	params.FilterDescendantsInstances = { GlobalConfig.DEBRIS, build, baseplate }
	local size = (select(2, build:GetBoundingBox()))
	local _filterDescendantsInstances = params.FilterDescendantsInstances
	local _build = build
	table.insert(_filterDescendantsInstances, _build)
	local parts = Workspace:GetPartBoundsInBox(cf, size, params)
	if #parts > 0 then
		return false
	end
	return true
end
