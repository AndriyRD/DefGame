-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return function(props)
	return Roact.createFragment({
		AmmoCount = Roact.createElement("TextLabel", {
			Size = UDim2.new(1, 0, .8, 0),
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.new(.5, 0, .2, 0),
			BackgroundTransparency = 1,
			Text = tostring(props.currentCount) .. ("/" .. tostring(props.maxCount)),
			TextColor3 = BrickColor.White().Color,
			Font = Enum.Font.RobotoMono,
			TextScaled = true,
		}),
	})
end
