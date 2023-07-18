-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local StaminaFrame = TS.import(script, script.Parent, "StaminaFrame")
local StateManager = TS.import(script, script.Parent.Parent, "StateManger").StateManager
local main = function(stamina)
	return Roact.createElement(StaminaFrame, {
		stamina = stamina,
	})
end
return function(stamina)
	Roact.mount(main(stamina), StateManager.PlayerGUI)
end
