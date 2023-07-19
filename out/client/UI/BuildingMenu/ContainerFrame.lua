-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local BuildingUIStateManger = TS.import(script, script.Parent, "BuildingUIStateManger").BuildingUIStateManger
local ContainerFrame
do
	ContainerFrame = Roact.Component:extend("ContainerFrame")
	function ContainerFrame:init()
	end
	function ContainerFrame:didMount()
		BuildingUIStateManger.ChangeCategory.Event:Connect(function(category) end)
	end
	function ContainerFrame:render()
		return Roact.createFragment({
			Content = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.new(.5, 0, .5, 0),
				Size = UDim2.new(.48, 0, .5, 0),
			}),
		})
	end
end
return {
	ContainerFrame = ContainerFrame,
}
