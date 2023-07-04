-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GameSessionManager = TS.import(script, game:GetService("ServerScriptService"), "TS", "GameSession", "GameSessionManager").GameSessionManager
-- new ApiServiceRegister()
-- .Register(new EquipmentService())
-- new EventRegister()
-- .Register(new WeaponEventListener())
-- .Register(new EquipmentEventListener())
local manager = GameSessionManager.new()
manager:NewSession()
