-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GameSessionManager = TS.import(script, game:GetService("ServerScriptService"), "TS", "GameLoader", "GameSession", "GameSessionManager").GameSessionManager
local manager = GameSessionManager.new()
manager:NewSession()
