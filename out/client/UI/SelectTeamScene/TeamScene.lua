-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local ReplicatedStorage = _services.ReplicatedStorage
local Workspace = _services.Workspace
local GetPlayerGui = TS.import(script, script.Parent.Parent, "GetPlayerGui")
local AnimatedTeamScene = TS.import(script, script.Parent, "AnimatedTeamScene").AnimatedTeamScene
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local TeamScene
do
	TeamScene = Roact.Component:extend("TeamScene")
	function TeamScene:init()
		self.sceneName = "SelectTeamScene"
		self.viewPortFrameName = "TeamSceneViewport"
		self.rigsContainerName = "Rigs"
		self.camera = Instance.new("Camera")
		self.scene = (ReplicatedStorage:WaitForChild(self.sceneName)):Clone()
		self.rigs = self.scene:WaitForChild(self.rigsContainerName)
	end
	function TeamScene:InitViewOrientation(scene)
		local sceneCF = scene:GetPivot()
		local offset = Vector3.new(-8, 0, 0)
		local cf = CFrame.lookAt(sceneCF:PointToWorldSpace(offset), sceneCF.Position)
		self.camera.CFrame = cf
		local _fn = scene
		local _exp = scene:GetPivot()
		local _arg0 = CFrame.Angles(0, math.rad(90), 0)
		_fn:PivotTo(_exp * _arg0)
	end
	function TeamScene:didMount()
		self.scene.Parent = GetPlayerGui():WaitForChild(self.sceneName):WaitForChild(self.viewPortFrameName)
		self:InitViewOrientation(self.scene)
		self.camera.Parent = Workspace
		self.camera.Name = "ViewPortCamera"
		self:setState({
			Enabled = true,
		})
	end
	function TeamScene:OnSelectTeam(name)
		RemoteProvider:GetTeam().JoinToTeam:FireServer(name)
		self:setState({
			Enabled = false,
		})
	end
	function TeamScene:render()
		return Roact.createFragment({
			[self.sceneName] = Roact.createElement("ScreenGui", {
				Enabled = self.state.Enabled,
				IgnoreGuiInset = true,
				ResetOnSpawn = false,
			}, {
				[self.viewPortFrameName] = Roact.createElement("ViewportFrame", {
					AnchorPoint = Vector2.new(.5, .5),
					Position = UDim2.new(.5, 0, .5, 0),
					Size = UDim2.new(1, 0, 1, 0),
					CurrentCamera = self.camera,
					BackgroundTransparency = 1,
					LightColor = BrickColor.White().Color,
					LightDirection = Vector3.new(100, -10, 0),
				}),
				Roact.createElement(AnimatedTeamScene, {
					Rigs = self.rigs:GetChildren(),
					OnSelectTeam = function(name)
						return self:OnSelectTeam(name)
					end,
				}),
			}),
		})
	end
end
return {
	TeamScene = TeamScene,
}
