-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local StaminaBar = TS.import(script, script.Parent, "StaminaBar").StaminaBar
return function(props)
	return Roact.createElement("ScreenGui", {
		ResetOnSpawn = false,
	}, {
		Roact.createElement("Frame", {
			BackgroundColor3 = BrickColor.Black().Color,
			Transparency = .5,
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.new(.5, 0, .91, 0),
			Size = UDim2.new(.18, 0, .05, 0),
		}, {
			Roact.createElement(StaminaBar, {
				stamina = props.stamina,
			}),
		}),
	})
end
