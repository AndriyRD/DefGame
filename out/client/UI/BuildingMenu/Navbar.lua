-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local NavbarButton = TS.import(script, script.Parent, "NavbarButton")
return function(props)
	local _categories = props.categories
	local _arg0 = function(name)
		return Roact.createElement(NavbarButton, {
			name = name,
		})
	end
	-- ▼ ReadonlyArray.map ▼
	local _newValue = table.create(#_categories)
	for _k, _v in _categories do
		_newValue[_k] = _arg0(_v, _k - 1, _categories)
	end
	-- ▲ ReadonlyArray.map ▲
	local _attributes = {
		AnchorPoint = Vector2.new(.5, .5),
		Size = UDim2.new(1, 0, .06, 0),
		Position = UDim2.new(.5, 0, 0.03, 0),
		BackgroundTransparency = 1,
	}
	local _children = {
		Roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(),
		}),
	}
	local _length = #_children
	for _k, _v in _newValue do
		_children[_length + _k] = _v
	end
	return Roact.createFragment({
		Navbar = Roact.createElement("Frame", _attributes, _children),
	})
end
