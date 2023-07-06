-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local ProductCard = TS.import(script, script.Parent.Parent, "Product", "ProductCard")
local WeaponShop = (Roact.createElement("Frame", {
	Size = UDim2.new(.5, 0, .6, 0),
	BackgroundColor3 = Color3.fromHex("#707070"),
	Position = UDim2.new(.5, 0, .5, 0),
	Transparency = .4,
	AnchorPoint = Vector2.new(.5, .5),
}, {
	Roact.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = "Center",
		Padding = UDim.new(.1),
	}),
	Roact.createElement(ProductCard, {
		title = "Test1",
		price = 150,
	}),
	Roact.createElement(ProductCard, {
		title = "Test2",
		price = 230,
	}),
}))
return function()
	return WeaponShop
end
