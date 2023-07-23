-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local Styles = TS.import(script, script.Parent.Parent, "Styles").Styles
return function(props)
	return Roact.createFragment({
		[props.name] = Roact.createElement("TextButton", {
			Text = props.name,
			BackgroundColor3 = Styles.ActiveRedColor,
			TextColor3 = BrickColor.White().Color,
			TextScaled = true,
			TextTransparency = 0,
			Font = "Roboto",
			Size = UDim2.new(.2, 0, 1, 0),
		}),
	})
end
