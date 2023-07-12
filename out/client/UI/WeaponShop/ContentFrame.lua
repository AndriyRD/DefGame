-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local ProductCard = TS.import(script, script.Parent.Parent, "Product", "ProductCard")
local PRODUCT_LIST = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Products", "PRODUCT_LIST")
return function()
	local cardSize = UDim2.new(.2, 0, .45, 0)
	local _weapon = PRODUCT_LIST.Weapon
	local _arg0 = function(product)
		return Roact.createElement(ProductCard, {
			title = product.ID,
			price = product.Price,
			size = cardSize,
		})
	end
	-- ▼ ReadonlyArray.map ▼
	local _newValue = table.create(#_weapon)
	for _k, _v in _weapon do
		_newValue[_k] = _arg0(_v, _k - 1, _weapon)
	end
	-- ▲ ReadonlyArray.map ▲
	local _attributes = {
		Size = UDim2.new(1, 0, .94, 0),
		Transparency = 1,
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.new(.5, 0, 0.5, 0),
	}
	local _children = {
		Roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = "Center",
			Padding = UDim.new(.1),
		}),
	}
	local _length = #_children
	for _k, _v in _newValue do
		_children[_length + _k] = _v
	end
	return Roact.createFragment({
		Content = Roact.createElement("Frame", _attributes, _children),
	})
end
