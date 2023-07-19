-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local COUNT_OF_ITEMS_IN_ROW = 5
local getCountRows = function(countOfItems)
	return math.floor(countOfItems / COUNT_OF_ITEMS_IN_ROW)
end
local getRows = function(items)
	return Roact.createFragment()
end
return function(props)
	return Roact.createFragment({
		List = Roact.createElement("Frame", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.new(1, 0, 1, 0),
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
		}, {
			getRows(props.items),
		}),
	})
end
