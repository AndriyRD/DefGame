-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players = _services.Players
local RunService = _services.RunService
local Workspace = _services.Workspace
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local CanBuild = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "CanBuild")
local MouseMoveHandler
do
	MouseMoveHandler = setmetatable({}, {
		__tostring = function()
			return "MouseMoveHandler"
		end,
	})
	MouseMoveHandler.__index = MouseMoveHandler
	function MouseMoveHandler.new(...)
		local self = setmetatable({}, MouseMoveHandler)
		return self:constructor(...) or self
	end
	function MouseMoveHandler:constructor()
		self.player = Players.LocalPlayer
		self.mouse = self.player:GetMouse()
		self.rayParams = RaycastParams.new()
		self.camera = Workspace.CurrentCamera
		self.maxDistance = 200
		self.rayParams.FilterDescendantsInstances = { GlobalConfig.DEBRIS }
		self.rayParams.FilterType = Enum.RaycastFilterType.Exclude
	end
	function MouseMoveHandler:Move(viewModel, pos)
		local model = viewModel:GetModel()
		local _fn = model
		local _cFrame = CFrame.new(pos)
		local _rotation = model:GetPivot().Rotation
		_fn:PivotTo(_cFrame * _rotation)
		if CanBuild(viewModel:GetModel(), viewModel:GetCF()) then
			if not viewModel:IsAvailableBuild() then
				viewModel:ChangeState()
			end
		elseif viewModel:IsAvailableBuild() then
			viewModel:ChangeState()
		end
	end
	function MouseMoveHandler:OnRender(viewModel)
		local cameraPos = self.camera.CFrame.Position
		local mousePos = self.mouse.Hit.Position
		local dir = CFrame.lookAt(cameraPos, mousePos).LookVector
		local _fn = Workspace
		local _maxDistance = self.maxDistance
		local res = _fn:Raycast(cameraPos, dir * _maxDistance, self.rayParams)
		if res then
			self:Move(viewModel, res.Position)
		end
	end
	function MouseMoveHandler:Start(viewModel)
		local _filterDescendantsInstances = self.rayParams.FilterDescendantsInstances
		local _arg0 = viewModel:GetModel()
		table.insert(_filterDescendantsInstances, _arg0)
		self.connection = RunService.Heartbeat:Connect(function()
			return self:OnRender(viewModel)
		end)
		viewModel:ChangeState()
		return self
	end
	function MouseMoveHandler:Stop()
		local _result = self.connection
		if _result ~= nil then
			_result:Disconnect()
		end
		return self
	end
end
return {
	MouseMoveHandler = MouseMoveHandler,
}
