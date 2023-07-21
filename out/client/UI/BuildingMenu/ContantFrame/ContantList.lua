-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local ArraySpliter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "ArraySpliter").ArraySpliter
local ListRow = TS.import(script, script.Parent, "ListRow")
local COUNT_OF_ITEMS_IN_ROW = 5
local getRows = function(items)
	local _exp = ArraySpliter:Split(items, COUNT_OF_ITEMS_IN_ROW)
	local _arg0 = function(v)
		return Roact.createElement(ListRow, {
			products = v,
			ySize = .1,
		})
	end
	-- ▼ ReadonlyArray.map ▼
	local _newValue = table.create(#_exp)
	for _k, _v in _exp do
		_newValue[_k] = _arg0(_v, _k - 1, _exp)
	end
	-- ▲ ReadonlyArray.map ▲
	return _newValue
end
return function(props)
	local _attributes = {
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.new(.5, 0, .5, 0),
		Size = UDim2.new(1, 0, .75, 0),
		BackgroundTransparency = 1,
	}
	local _children = {
		Roact.createElement("UIListLayout", {
			FillDirection = "Vertical",
			Padding = UDim.new(.05),
		}),
	}
	local _length = #_children
	for _k, _v in getRows(props.items) do
		_children[_length + _k] = _v
	end
	return Roact.createFragment({
		List = Roact.createElement("ScrollingFrame", _attributes, _children),
	})
end
