-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local GameLoader = TS.import(script, script.Parent, "GameLoader", "ClientGameLoader").GameLoader
local TeamWarsGameMode = TS.import(script, script.Parent, "GameLoader", "Mods", "TeamWarsGameMode").TeamWarsGameMode
local remote = ReplicatedStorage:WaitForChild("Equipment"):WaitForChild("Remote")
local craeteEquipmentEvent = remote:WaitForChild("CreateEquipment")
-- craeteEquipmentEvent.FireServer('RocketLauncher')
GameLoader.new():RegisterGameMode(TeamWarsGameMode.new()):Startup()
craeteEquipmentEvent:FireServer("AK47")
