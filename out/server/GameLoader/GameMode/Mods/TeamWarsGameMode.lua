-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EventRegister = TS.import(script, game:GetService("ServerScriptService"), "TS", "Core", "EventSystem", "EventRegister").EventRegister
local GameModeLoader = TS.import(script, game:GetService("ServerScriptService"), "TS", "GameLoader", "GameMode", "GameModeLoader").GameModeLoader
local WeaponEventListener = TS.import(script, game:GetService("ServerScriptService"), "TS", "Weapon", "FrontLayer", "WeaponEventListener").WeaponEventListener
local EquipmentEventListener = TS.import(script, game:GetService("ServerScriptService"), "TS", "Equipment", "FrontLayer", "EquipmentEventListener").EquipmentEventListener
local ApiServiceRegister = TS.import(script, game:GetService("ServerScriptService"), "TS", "Core", "ApiService", "ApiServiceRegister").ApiServiceRegister
local EquipmentService = TS.import(script, game:GetService("ServerScriptService"), "TS", "Equipment", "FrontLayer", "EquipmentService").EquipmentService
local RunnerEventListener = TS.import(script, game:GetService("ServerScriptService"), "TS", "Runner", "RunnerEventListener").RunnerEventListener
local GAME_MODE_IDS = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GameLoader", "GAME_MODE_IDS").GAME_MODE_IDS
local BuildingEventListener = TS.import(script, game:GetService("ServerScriptService"), "TS", "BuildSystem", "FrontLayer", "BuildingEventListener").BuildingEventListener
local Test = TS.import(script, game:GetService("ServerScriptService"), "TS", "GameLoader", "GameMap", "Maps", "TeamWars", "Test").Test
local TeamEventListener = TS.import(script, game:GetService("ServerScriptService"), "TS", "Team", "TeamEventListener").TeamEventListener
local TeamWarsGameMode
do
	local super = GameModeLoader
	TeamWarsGameMode = setmetatable({}, {
		__tostring = function()
			return "TeamWarsGameMode"
		end,
		__index = super,
	})
	TeamWarsGameMode.__index = TeamWarsGameMode
	function TeamWarsGameMode.new(...)
		local self = setmetatable({}, TeamWarsGameMode)
		return self:constructor(...) or self
	end
	function TeamWarsGameMode:constructor(...)
		super.constructor(self, ...)
		self.ID = GAME_MODE_IDS.TEAM_WARS
		self.description = {
			TeamOptions = nil,
			ProductOptions = nil,
		}
	end
	function TeamWarsGameMode:RunEventListeners()
		EventRegister.new():Register(WeaponEventListener.new()):Register(EquipmentEventListener.new()):Register(RunnerEventListener.new()):Register(BuildingEventListener.new()):Register(TeamEventListener.new())
	end
	function TeamWarsGameMode:RunApiServices()
		ApiServiceRegister.new():Register(EquipmentService.new())
	end
	function TeamWarsGameMode:LaodMaps()
		self.mapManager:RegisterMap(Test.new())
	end
	function TeamWarsGameMode:Load(mapID)
		self:RunApiServices()
		self:RunEventListeners()
		return super.Load(self, mapID)
	end
	function TeamWarsGameMode:Unload()
	end
end
return {
	TeamWarsGameMode = TeamWarsGameMode,
}
