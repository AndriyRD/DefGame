-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local StaminaBar
do
	StaminaBar = Roact.Component:extend("StaminaBar")
	function StaminaBar:init(props)
	end
	function StaminaBar:GetSize(staminaValue)
		local max = self.props.stamina:GetMaxValue()
		local x = 1 - (1 - (staminaValue / max))
		return UDim2.new(x, 0, 1, 0)
	end
	function StaminaBar:didMount()
		self.props.stamina.OnUpdateValue.Event:Connect(function(v)
			self:setState({
				size = self:GetSize(v),
			})
		end)
		self:setState({
			size = UDim2.new(1, 0, 1, 0),
		})
	end
	function StaminaBar:render()
		return Roact.createElement("Frame", {
			Size = self.state.size,
			BackgroundColor3 = BrickColor.White().Color,
			Transparency = .35,
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.new(.5, 0, .5, 0),
		})
	end
end
return {
	StaminaBar = StaminaBar,
}
