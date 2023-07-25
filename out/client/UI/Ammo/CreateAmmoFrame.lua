-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local AmmoFrame = TS.import(script, script.Parent, "AmmoFrame").AmmoFrame
local GetPlayerGui = TS.import(script, script.Parent.Parent, "GetPlayerGui")
local main = function()
	return Roact.createElement(AmmoFrame)
end
return function()
	Roact.mount(main(), GetPlayerGui(), "AmmoFrame")
end
