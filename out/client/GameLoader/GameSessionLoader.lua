-- Compiled with roblox-ts v2.1.0
local GameSessionLoader
do
	GameSessionLoader = setmetatable({}, {
		__tostring = function()
			return "GameSessionLoader"
		end,
	})
	GameSessionLoader.__index = GameSessionLoader
	function GameSessionLoader.new(...)
		local self = setmetatable({}, GameSessionLoader)
		return self:constructor(...) or self
	end
	function GameSessionLoader:constructor()
	end
	function GameSessionLoader:NewSession(gameMode)
		self.currentGameMode = gameMode
		gameMode:Run()
	end
	function GameSessionLoader:LoadMap(map)
		local _result = self.currentGameMode
		if _result ~= nil then
			_result:Run()
		end
	end
	function GameSessionLoader:UnloadMap()
		local _result = self.currentGameMode
		if _result ~= nil then
			_result:Dispose()
		end
	end
end
return {
	GameSessionLoader = GameSessionLoader,
}
