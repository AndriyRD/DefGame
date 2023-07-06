-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local TextFrame = TS.import(script, script.Parent, "TextFrame")
return function(props)
	return Roact.createElement("Frame", {
		BackgroundColor3 = Color3.fromHex("#5c5b5d"),
		Transparency = .3,
		Size = UDim2.new(0.2, 0, 0.2, 0),
	}, {
		Roact.createElement(TextFrame, {
			text = props.title,
		}),
	})
end
