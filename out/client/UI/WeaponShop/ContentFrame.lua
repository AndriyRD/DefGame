-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local ProductCard = TS.import(script, script.Parent.Parent, "Product", "ProductCard")
return function()
	local cardSize = UDim2.new(.2, 0, .45, 0)
	return Roact.createFragment({
		Content = Roact.createElement("Frame", {
			Size = UDim2.new(1, 0, .94, 0),
			Transparency = 1,
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.new(.5, 0, 0.5, 0),
		}, {
			Roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = "Center",
				Padding = UDim.new(.1),
			}),
			Roact.createElement(ProductCard, {
				title = "Test1",
				price = 150,
				size = cardSize,
			}),
			Roact.createElement(ProductCard, {
				title = "Test2",
				price = 230,
				size = cardSize,
			}),
			Roact.createElement(ProductCard, {
				title = "Test2",
				price = 230,
				size = cardSize,
			}),
		}),
	})
end
