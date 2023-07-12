-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return function()
	return Roact.createElement("TextButton", {
		Size = UDim2.new(.25, 0, .15, 0),
		Position = UDim2.new(.7, 0, .5, 0),
		AnchorPoint = Vector2.new(.5, .5),
		BackgroundColor3 = BrickColor.Red().Color,
		TextColor3 = BrickColor.White().Color,
		Text = "Buy",
	})
end
