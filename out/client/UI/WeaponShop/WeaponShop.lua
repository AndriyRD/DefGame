-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local ContentFrame = TS.import(script, script.Parent, "ContentFrame")
local WeaponShop = (Roact.createFragment({
	WeaponShop = Roact.createElement("Frame", {
		Size = UDim2.new(.5, 0, .6, 0),
		BackgroundColor3 = Color3.fromHex("#707070"),
		Position = UDim2.new(.5, 0, .5, 0),
		Transparency = .6,
		AnchorPoint = Vector2.new(.5, .5),
		BorderColor3 = BrickColor.White().Color,
	}, {
		Roact.createElement(ContentFrame),
	}),
}))
return function()
	return WeaponShop
end
