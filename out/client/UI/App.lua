-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local BuildingMenu = TS.import(script, script.Parent, "BuildingMenu", "BuildingMenu").BuildingMenu
local CreateAmmoFrame = TS.import(script, script.Parent, "Ammo", "CreateAmmoFrame")
local TeamScene = TS.import(script, script.Parent, "SelectTeamScene", "TeamScene").TeamScene
local playerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
return function()
	local app = (Roact.createElement("ScreenGui", {
		Enabled = true,
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
	}, {
		Roact.createElement(BuildingMenu),
	}))
	local teamScene = function()
		return Roact.createElement(TeamScene)
	end
	CreateAmmoFrame()
	Roact.mount(app, playerGui, "MainUI")
	Roact.mount(teamScene(), playerGui)
end
