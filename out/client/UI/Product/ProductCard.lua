-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local TextFrame = TS.import(script, script.Parent, "TextFrame")
local Styles = TS.import(script, script.Parent.Parent, "Styles").Styles
return function(props)
	return Roact.createFragment({
		ProductCard = Roact.createElement("Frame", {
			AnchorPoint = Vector2.new(.5, .5),
			BackgroundColor3 = Color3.fromHex("#5c5b5d"),
			Transparency = .3,
			Size = props.size,
			BorderColor3 = Styles.StandartBorderColor,
			[Roact.Event.MouseEnter] = function(rbx)
				rbx.BorderColor3 = Styles.ActiveRedColor
				return rbx.BorderColor3
			end,
			[Roact.Event.MouseLeave] = function(rbx)
				rbx.BorderColor3 = Styles.StandartBorderColor
				return rbx.BorderColor3
			end,
		}, {
			Roact.createElement(TextFrame, {
				text = props.title,
			}),
			Roact.createElement("TextButton", {
				Size = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.new(.5, 0, .5, 0),
				Transparency = 1,
				[Roact.Event.Activated] = function(rbx)
					if props.onSelect then
						props.onSelect(props.title)
					end
					(rbx.Parent).BorderColor3 = Styles.StandartBorderColor
				end,
			}),
		}),
	})
end
