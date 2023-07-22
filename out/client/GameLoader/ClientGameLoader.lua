-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local GameSessionLoader = TS.import(script, script.Parent, "GameSessionLoader").GameSessionLoader
local Workspace = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local GameLoader
do
	GameLoader = setmetatable({}, {
		__tostring = function()
			return "GameLoader"
		end,
	})
	GameLoader.__index = GameLoader
	function GameLoader.new(...)
		local self = setmetatable({}, GameLoader)
		return self:constructor(...) or self
	end
	function GameLoader:constructor()
		self.remote = RemoteProvider:GetForGameLoader()
		self.gameModeSessionLoader = GameSessionLoader.new()
		self.gameMods = {}
	end
	function GameLoader:GetMapModel()
		return Workspace:WaitForChild(GlobalConfig.LAODED_MAP_NAME)
	end
	function GameLoader:IsRunningGame()
		return self:GetMapModel():GetAttribute(GlobalConfig.ATTRIBUTES_NAMES.IS_STARTING_GAME)
	end
	function GameLoader:GetCurrentGameMode()
		local currentMap = self:GetMapModel()
		if not currentMap then
			error("Not found game-map")
		end
		return currentMap:GetAttribute(GlobalConfig.ATTRIBUTES_NAMES.GAME_MODE)
	end
	function GameLoader:OnNewSession(gameModeID)
		local _gameMods = self.gameMods
		local _gameModeID = gameModeID
		local currentGameMode = _gameMods[_gameModeID]
		if not currentGameMode then
			error("Not found game-mode: " .. gameModeID)
		end
		self.gameModeSessionLoader:NewSession(currentGameMode)
	end
	function GameLoader:Startup()
		self.remote.NewSession.OnClientEvent:Connect(function(mode)
			return self:OnNewSession(mode)
		end)
		local _value = self:IsRunningGame()
		if _value ~= 0 and (_value == _value and (_value ~= "" and _value)) then
			self:OnNewSession(self:GetCurrentGameMode())
		end
	end
	function GameLoader:RegisterGameMode(gameMode)
		local _gameMods = self.gameMods
		local _arg0 = gameMode:GetID()
		local _gameMode = gameMode
		_gameMods[_arg0] = _gameMode
		return self
	end
end
return {
	GameLoader = GameLoader,
}
