-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local Component = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src").Component
local AmmoLabel = TS.import(script, script.Parent, "AmmoLabel")
local EventProvider = TS.import(script, script.Parent.Parent.Parent, "EventProvider").EventProvider
local AmmoStateManager = TS.import(script, script.Parent, "AmmoStateManager").AmmoStateManager
local AmmoFrame
do
	AmmoFrame = Component:extend("AmmoFrame")
	function AmmoFrame:init()
		self.ammoStateManager = AmmoStateManager.new()
	end
	function AmmoFrame:OnUpdate(ammoContainerState)
		self:setState(ammoContainerState)
	end
	function AmmoFrame:didMount()
		EventProvider.Weapon.Equip.Event:Connect(function(ammoContainer, initState)
			self:setState({
				Enabled = true,
			})
			self:OnUpdate(initState)
			self.ammoStateManager:SetAmmoContainer(ammoContainer)
		end)
		EventProvider.Weapon.Unequip.Event:Connect(function()
			self:setState({
				Enabled = false,
			})
			self.ammoStateManager:Clear()
		end)
		self:setState({
			Enabled = false,
		})
		self.ammoStateManager.Changed.Event:Connect(function(state)
			return self:OnUpdate(state)
		end)
	end
	function AmmoFrame:render()
		return Roact.createElement("ScreenGui", {
			ResetOnSpawn = false,
			Enabled = self.state.Enabled,
		}, {
			Ammo = Roact.createElement("Frame", {
				Size = UDim2.new(.16, 0, .08, 0),
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.new(.92, 0, .96, 0),
				Transparency = 1,
			}, {
				Roact.createElement(AmmoLabel, {
					currentCount = self.state.Mag,
					maxCount = self.state.Ammo,
				}),
				Roact.createElement("Frame", {
					AnchorPoint = Vector2.new(.5, .5),
					Size = UDim2.new(.9, 0, .05, 0),
					Position = UDim2.new(.5, 0, .8, 0),
					BackgroundColor3 = BrickColor.White().Color,
					Transparency = 0,
					BorderSizePixel = 0,
				}),
			}),
		})
	end
end
return {
	AmmoFrame = AmmoFrame,
}
