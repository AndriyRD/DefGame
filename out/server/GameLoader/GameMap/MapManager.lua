-- Compiled with roblox-ts v2.1.0
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
	function MapManager:constructor()
		self.gameMaps = {}
	end
	function MapManager:Select(id)
		local _gameMaps = self.gameMaps
		local _id = id
		local newMap = _gameMaps[_id]
		if not newMap then
			error("Not found game-map: " .. id)
		end
		local _result = self.currentMap
		if _result ~= nil then
			_result:Destory()
		end
		self.currentMap = newMap
		self.currentMap:Sapwn()
		return self.currentMap
	end
	function MapManager:RegisterMap(gameMap)
		local _gameMaps = self.gameMaps
		local _arg0 = gameMap:GetID()
		local _gameMap = gameMap
		_gameMaps[_arg0] = _gameMap
		return self
	end
end
return {
	MapManager = MapManager,
}
