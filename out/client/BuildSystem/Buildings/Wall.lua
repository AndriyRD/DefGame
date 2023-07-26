-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BUILDINGS_IDS = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "Building", "BUILDINGS_IDS").BUILDINGS_IDS
local Building = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "Building", "Building").Building
local Wall
do
	local super = Building
	Wall = setmetatable({}, {
		__tostring = function()
			return "Wall"
		end,
		__index = super,
	})
	Wall.__index = Wall
	function Wall.new(...)
		local self = setmetatable({}, Wall)
		return self:constructor(...) or self
	end
	function Wall:constructor(...)
		super.constructor(self, ...)
	end
	function Wall:GetID()
		return BUILDINGS_IDS.BASE_WALL
	end
	function Wall:OnBuild()
	end
end
return {
	Wall = Wall,
}
