-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local ContentFrame = TS.import(script, script.Parent, "ContentFrame")
local BuyBtn = TS.import(script, script.Parent, "BuyBtn")
local Styles = TS.import(script, script.Parent.Parent, "Styles").Styles
local WeaponShop = (Roact.createFragment({
	WeaponShop = Roact.createElement("Frame", {
		Size = UDim2.new(.5, 0, .6, 0),
		BackgroundColor3 = Styles.Menu.BackgroundColor,
		Position = UDim2.new(.5, 0, .5, 0),
		Transparency = Styles.Menu.Transparency,
		AnchorPoint = Vector2.new(.5, .5),
		BorderColor3 = BrickColor.White().Color,
	}, {
		Roact.createElement(ContentFrame),
		Roact.createElement(BuyBtn),
	}),
}))
return function()
	return WeaponShop
end
