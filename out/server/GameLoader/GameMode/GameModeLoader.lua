-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local MapManager = TS.import(script, game:GetService("ServerScriptService"), "TS", "GameLoader", "GameMap", "MapManager").MapManager
local GameModeLoader
do
	GameModeLoader = {}
	function GameModeLoader:constructor()
		self.description = {
			TeamOptions = nil,
			ProductOptions = nil,
		}
		self.mapManager = MapManager.new()
		self:LaodMaps()
	end
	function GameModeLoader:Load(mapID)
		local map = self.mapManager:Select(mapID):GetModel()
		map:SetAttribute(GlobalConfig.ATTRIBUTES_NAMES.GAME_MODE, self.ID)
		map:SetAttribute(GlobalConfig.ATTRIBUTES_NAMES.IS_STARTING_GAME, true)
		return self
	end
end
return {
	GameModeLoader = GameModeLoader,
}
