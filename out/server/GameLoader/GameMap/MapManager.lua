-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local FactoryMap = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "FactoryMap").FactoryMap
local GameMap = TS.import(script, game:GetService("ServerScriptService"), "TS", "GameLoader", "GameMap", "GameMap").GameMap
local Workspace = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local MapManager
do
	MapManager = setmetatable({}, {
		__tostring = function()
			return "MapManager"
		end,
	})
	MapManager.__index = MapManager
	function MapManager.new(...)
		local self = setmetatable({}, MapManager)
		return self:constructor(...) or self
	end
	function MapManager:constructor(list)
		self.list = list
		self.factories = FactoryMap.new()
		for _, name in list do
			self.factories:Set(name, function()
				return GameMap.new(name)
			end)
		end
	end
	function MapManager:Select(id)
		local newMap = self.factories:Find(id)
		if not newMap then
			error("Not found game-map: " .. id)
		end
		local _result = self.currentMap
		if _result ~= nil then
			_result:Destory()
		end
		self.currentMap = newMap()
		local model = self.currentMap:GetModel()
		model.Parent = Workspace
		model.Name = GlobalConfig.LAODED_MAP_NAME
		return self.currentMap
	end
end
return {
	MapManager = MapManager,
}
