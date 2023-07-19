-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local ProductCard = TS.import(script, script.Parent.Parent.Parent, "Product", "ProductCard")
return function(props)
	local _products = props.products
	local _arg0 = function(v)
		return Roact.createElement(ProductCard, {
			price = v.Price,
			size = UDim2.new(.18, 0, 1, 0),
			title = v.ID,
		})
	end
	-- ▼ ReadonlyArray.map ▼
	local _newValue = table.create(#_products)
	for _k, _v in _products do
		_newValue[_k] = _arg0(_v, _k - 1, _products)
	end
	-- ▲ ReadonlyArray.map ▲
	local _attributes = {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(.5, .5),
		Size = UDim2.new(1, 0, props.ySize, 0),
	}
	local _children = {
		Roact.createElement("UIListLayout", {
			FillDirection = "Horizontal",
		}),
	}
	local _length = #_children
	for _k, _v in _newValue do
		_children[_length + _k] = _v
	end
	return Roact.createElement("Frame", _attributes, _children)
end
