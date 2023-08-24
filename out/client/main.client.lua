-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players = _services.Players
local ReplicatedStorage = _services.ReplicatedStorage
local GameLoader = TS.import(script, script.Parent, "GameLoader", "ClientGameLoader").GameLoader
local TeamWarsGameMode = TS.import(script, script.Parent, "GameLoader", "Mods", "TeamWars", "TeamWarsGameMode").TeamWarsGameMode
local CharacterController = TS.import(script, script.Parent, "CharacterController", "CharacterController").CharacterController
local _ReloadableCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "ReloadableCharacter")
local CHARACTER_LOAD_EVENT_NAMES = _ReloadableCharacter.CHARACTER_LOAD_EVENT_NAMES
local ReloadableCharacter = _ReloadableCharacter.ReloadableCharacter
local remote = ReplicatedStorage:WaitForChild("Equipment"):WaitForChild("Remote")
local craeteEquipmentEvent = remote:WaitForChild("CreateEquipment")
-- craeteEquipmentEvent.FireServer('RocketLauncher')
CharacterController.new():Start()
GameLoader.new():RegisterGameMode(TeamWarsGameMode.new()):Startup()
craeteEquipmentEvent:FireServer("AK47")
local _events = ReloadableCharacter.new(Players.LocalPlayer).Events
local _cHARACTER = CHARACTER_LOAD_EVENT_NAMES.CHARACTER
local _result = _events[_cHARACTER]
if _result ~= nil then
	_result = _result.Event:Connect(function()
		craeteEquipmentEvent:FireServer("AK47")
	end)
end
