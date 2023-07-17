-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local Styles = TS.import(script, script.Parent.Parent, "Styles").Styles
local Navbar = TS.import(script, script.Parent, "Navbar")
local BUILDING_CATEGORIES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Products", "BUILDING_CATEGORIES").BUILDING_CATEGORIES
return function()
	return Roact.createElement("Frame", {
		Size = UDim2.new(.6, 0, .6, 0),
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.new(.5, 0, .5, 0),
		BackgroundColor3 = BrickColor.Black().Color,
		Transparency = Styles.Menu.Transparency,
	}, {
		Roact.createElement(Navbar, {
			categories = { BUILDING_CATEGORIES.BASE },
		}),
	})
end
