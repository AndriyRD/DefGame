-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return function(props)
	return Roact.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Text = props.text,
		Font = Enum.Font.SourceSans,
		TextColor3 = Color3.fromHex("#fdfaff"),
		TextScaled = true,
		Position = props.pos,
		Size = props.size,
		AnchorPoint = Vector2.new(.5, .5),
	})
end
