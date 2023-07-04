-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local TeamWarsGameMode = TS.import(script, game:GetService("ServerScriptService"), "TS", "GameSession", "GameMods", "TeamWarsGameMode").TeamWarsGameMode
local GameSessionManager
do
	GameSessionManager = setmetatable({}, {
		__tostring = function()
			return "GameSessionManager"
		end,
	})
	GameSessionManager.__index = GameSessionManager
	function GameSessionManager.new(...)
		local self = setmetatable({}, GameSessionManager)
		return self:constructor(...) or self
	end
	function GameSessionManager:constructor()
	end
	function GameSessionManager:NewSession()
		if self.currentModeLoader then
			self.currentModeLoader:Unload()
		end
		self.currentModeLoader = TeamWarsGameMode.new():Load("Test")
	end
end
return {
	GameSessionManager = GameSessionManager,
}
