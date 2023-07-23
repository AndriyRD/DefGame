-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local Roact = _roact
local Component = _roact.Component
local Styles = TS.import(script, script.Parent.Parent, "Styles").Styles
local Navbar = TS.import(script, script.Parent, "Navbar")
local BUILDING_CATEGORIES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Products", "BUILDING_CATEGORIES").BUILDING_CATEGORIES
local ContantList = TS.import(script, script.Parent, "ContantFrame", "ContantList")
local PRODUCT_LIST = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Products", "PRODUCT_LIST")
local EventProvider = TS.import(script, script.Parent.Parent.Parent, "EventProvider").EventProvider
local BuildingMenu
do
	BuildingMenu = Component:extend("BuildingMenu")
	function BuildingMenu:init()
	end
	function BuildingMenu:didMount()
		EventProvider.Build.PreviewMode.Event:Connect(function()
			return self:setState({
				Enabled = false,
			})
		end)
	end
	function BuildingMenu:render()
		return Roact.createElement("ScreenGui", {
			ResetOnSpawn = false,
			Enabled = self.state.Enabled,
		}, {
			BuildingMenu = Roact.createElement("Frame", {
				Size = UDim2.new(.6, 0, .6, 0),
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.new(.5, 0, .5, 0),
				BackgroundColor3 = BrickColor.Black().Color,
				Transparency = Styles.Menu.Transparency,
			}, {
				Roact.createElement(Navbar, {
					categories = { BUILDING_CATEGORIES.BASE },
				}),
				Roact.createElement(ContantList, {
					items = PRODUCT_LIST.Building,
				}),
			}),
		})
	end
end
return {
	BuildingMenu = BuildingMenu,
}
