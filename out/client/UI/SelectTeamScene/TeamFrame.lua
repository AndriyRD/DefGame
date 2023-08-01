-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local TeamFrame
do
	TeamFrame = Roact.Component:extend("TeamFrame")
	function TeamFrame:init()
		self.frameXSize = 1 / self.props.CountOfTeams
		self.frameXOffset = self.frameXSize * self.props.Index
	end
	function TeamFrame:OnInput(input, frame)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			self.props.OnSelect(frame)
		end
	end
	function TeamFrame:render()
		return Roact.createFragment({
			[self.props.Rig.Name] = Roact.createElement("Frame", {
				Size = UDim2.new(self.frameXSize, 0, 1, 0),
				AnchorPoint = Vector2.new(0, .5),
				Position = UDim2.new(self.frameXOffset, 0, .5, 0),
				BackgroundTransparency = 1,
				BackgroundColor3 = self.props.TeamColor,
				[Roact.Event.MouseEnter] = function(rbx)
					return self.props.OnHover(rbx, self.props.Rig)
				end,
				[Roact.Event.MouseLeave] = function(rbx)
					return self.props.OnEndHover(rbx, self.props.Rig)
				end,
				[Roact.Event.InputBegan] = function(rbx, input)
					return self:OnInput(input, rbx)
				end,
			}),
		})
	end
end
return {
	TeamFrame = TeamFrame,
}
