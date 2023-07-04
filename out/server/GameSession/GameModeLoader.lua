-- Compiled with roblox-ts v2.1.0
local GameModeLoader
do
	GameModeLoader = {}
	function GameModeLoader:constructor()
		self.description = {
			TeamOptions = nil,
			ProductOptions = nil,
			MapIDList = { "" },
		}
	end
	function GameModeLoader:Load(mapID)
		self.mapManager:Select(mapID)
		return self
	end
end
return {
	GameModeLoader = GameModeLoader,
}
