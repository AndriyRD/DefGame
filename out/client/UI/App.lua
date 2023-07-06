-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local WeaponShop = TS.import(script, script.Parent, "WeaponShop", "WeaponShop")
local playerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
return function()
	local app = (Roact.createElement("ScreenGui", {
		Enabled = true,
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
	}, {
		Roact.createElement(WeaponShop),
	}))
	Roact.mount(app, playerGui, "MainUI")
end
