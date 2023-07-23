-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local ReplicatedStorage = _services.ReplicatedStorage
local Workspace = _services.Workspace
local TeamScene
do
	TeamScene = setmetatable({}, {
		__tostring = function()
			return "TeamScene"
		end,
	})
	TeamScene.__index = TeamScene
	function TeamScene.new(...)
		local self = setmetatable({}, TeamScene)
		return self:constructor(...) or self
	end
	function TeamScene:constructor()
		self.sceneModel = ReplicatedStorage:WaitForChild("SelectTeamScene")
		self.camera = Workspace.CurrentCamera
		self.sceneCF = CFrame.new(0, -100, 0)
		self.cameraOffset = CFrame.new(0, 0, -8)
		self.rigsContainerName = "Rigs"
		self.scaleSeletcedRig = 1.08
	end
	function TeamScene:SetCameraToScene()
		self.camera.CFrame = self.sceneCF:ToWorldSpace(self.cameraOffset)
		local _cFrame = self.camera.CFrame
		local _arg0 = CFrame.lookAt(self.camera.CFrame.Position, self.sceneCF.Position)
		self.camera.CFrame = (_cFrame * _arg0).Rotation
	end
	function TeamScene:PlaceScene()
		local newScene = self.sceneModel:Clone()
		newScene.Parent = Workspace
		newScene:PivotTo(self.sceneCF)
		return newScene
	end
	function TeamScene:SetClickDetectorToRigs(model)
		local rigs = model:WaitForChild(self.rigsContainerName)
		for _, item in rigs:GetChildren() do
			if item:IsA("Model") then
				local detector = Instance.new("ClickDetector", item)
				detector.MouseHoverEnter:Connect(function()
					return item:ScaleTo(self.scaleSeletcedRig)
				end)
				detector.MouseHoverLeave:Connect(function()
					return item:ScaleTo(1)
				end)
				detector.MouseClick:Connect(function()
					return print("Select team: " .. item.Name)
				end)
			end
		end
	end
	function TeamScene:Show()
		local scene = self:PlaceScene()
		self:SetCameraToScene()
		self:SetClickDetectorToRigs(scene)
		print("Show scene")
	end
end
return {
	TeamScene = TeamScene,
}
