-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local TeamWarsGameMode = TS.import(script, game:GetService("ServerScriptService"), "TS", "GameLoader", "GameMode", "Mods", "TeamWarsGameMode").TeamWarsGameMode
local GAME_MODE_IDS = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GameLoader", "GAME_MODE_IDS").GAME_MODE_IDS
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
		self.remote = RemoteProvider:GetForGameLoader()
	end
	function GameSessionManager:NewSession()
		if self.currentModeLoader then
			self.currentModeLoader:Unload()
		end
		self.currentModeLoader = TeamWarsGameMode.new():Load("Test")
		self.remote.NewSession:FireAllClients(GAME_MODE_IDS.TEAM_WARS)
	end
end
return {
	GameSessionManager = GameSessionManager,
}
