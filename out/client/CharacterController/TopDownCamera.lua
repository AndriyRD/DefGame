-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local RunService = _services.RunService
local Workspace = _services.Workspace
local TopDownCamera
do
	TopDownCamera = setmetatable({}, {
		__tostring = function()
			return "TopDownCamera"
		end,
	})
	TopDownCamera.__index = TopDownCamera
	function TopDownCamera.new(...)
		local self = setmetatable({}, TopDownCamera)
		return self:constructor(...) or self
	end
	function TopDownCamera:constructor(owner, character)
		self.owner = owner
		self.character = character
		self.camera = Workspace.CurrentCamera
		self.screenGui = Instance.new("ScreenGui")
		self.distance = Vector3.new(0, 35, 0)
		self.cameraSensitivity = 20
		self.direction = Vector3.new(0, -1, 0)
		self.renderStepName = "Camera"
		self.mouse = self.owner:GetMouse()
		self.screenGui.Parent = owner:WaitForChild("PlayerGui")
	end
	function TopDownCamera:getMouseScreenPositionCentered()
		return Vector2.new(self.mouse.X - self.screenGui.AbsoluteSize.X / 2, self.mouse.Y - self.screenGui.AbsoluteSize.Y / 2)
	end
	function TopDownCamera:pixelToFraction(pixelV2)
		local _pixelV2 = pixelV2
		local _absoluteSize = self.screenGui.AbsoluteSize
		return _pixelV2 / _absoluteSize
	end
	function TopDownCamera:GetCameraCFrame()
		local rootPart = self.character:GetRoot()
		local _position = rootPart.Position
		local _vector3 = Vector3.new(0, 0, 3)
		local playerPosition = _position + _vector3
		local cameraoffset = self.distance + playerPosition
		local mouseScreenPos = self:pixelToFraction(self:getMouseScreenPositionCentered())
		local axis = Vector3.new(-mouseScreenPos.Y, 0, mouseScreenPos.X)
		local _cameraSensitivity = self.cameraSensitivity
		local _arg0 = axis * _cameraSensitivity
		local cameraPos = cameraoffset + _arg0
		local _direction = self.direction
		return CFrame.new(cameraPos, cameraPos + _direction)
	end
	function TopDownCamera:OnRender()
		self.camera.CFrame = self:GetCameraCFrame()
	end
	function TopDownCamera:Enable()
		RunService:BindToRenderStep(self.renderStepName, Enum.RenderPriority.Camera.Value, function()
			return self:OnRender()
		end)
		return self
	end
	function TopDownCamera:Disable()
		RunService:UnbindFromRenderStep(self.renderStepName)
		return self
	end
end
return {
	TopDownCamera = TopDownCamera,
}
