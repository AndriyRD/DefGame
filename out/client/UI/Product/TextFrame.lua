-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local Title = TS.import(script, script.Parent, "Title")
return function(props)
	return Roact.createElement("Frame", {
		BackgroundColor3 = Color3.fromHex("#49494a"),
		Transparency = .25,
		Size = UDim2.new(1, 0, .2, 0),
		BackgroundTransparency = 1,
	}, {
		Roact.createElement(Title, {
			text = props.text,
			pos = UDim2.new(0.5, 0, 0.85, 0),
			size = UDim2.new(1, 0, 1, 0),
		}),
	})
end
