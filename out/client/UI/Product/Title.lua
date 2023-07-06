-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return function(prop)
	return Roact.createElement("TextLabel", {
		Text = prop.text,
		TextColor3 = Color3.fromHex("#fdfaff"),
		TextScaled = true,
		Position = prop.pos,
		Size = prop.size,
		AnchorPoint = Vector2.new(.5, .5),
	})
end
