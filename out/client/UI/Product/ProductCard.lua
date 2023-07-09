-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local TextFrame = TS.import(script, script.Parent, "TextFrame")
return function(props)
	return Roact.createFragment({
		ProductCard = Roact.createElement("Frame", {
			AnchorPoint = Vector2.new(.5, .5),
			BackgroundColor3 = Color3.fromHex("#5c5b5d"),
			Transparency = .3,
			Size = props.size,
			BorderColor3 = BrickColor.White().Color,
		}, {
			Roact.createElement(TextFrame, {
				text = props.title,
			}),
		}),
	})
end
