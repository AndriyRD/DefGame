-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return function(props)
	return Roact.createElement("ScrollingFrame", {
		BackgroundTransparency = 0,
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(.5, 0, .5, 0),
		Size = UDim2.new(1, 0, 1, 0),
	})
end
