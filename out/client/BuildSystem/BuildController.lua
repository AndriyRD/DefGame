-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local BaseViewModelConfig = TS.import(script, script.Parent, "ViewModel", "BaseViewModelConfig")
local ViewModel = TS.import(script, script.Parent, "ViewModel", "ViewModel").ViewModel
local MouseMoveHandler = TS.import(script, script.Parent, "ViewModel", "MouseMoveHandler").MouseMoveHandler
local ClientBuildingManger = TS.import(script, script.Parent, "ClinetBuildingManager").ClientBuildingManger
local BuildController
do
	BuildController = setmetatable({}, {
		__tostring = function()
			return "BuildController"
		end,
	})
	BuildController.__index = BuildController
	function BuildController.new(...)
		local self = setmetatable({}, BuildController)
		return self:constructor(...) or self
	end
	function BuildController:constructor()
		self.moveHandler = MouseMoveHandler.new()
		self.viewModelConfig = BaseViewModelConfig
		self.buildEvent = RemoteProvider:GetForBuild().Build
		self.buildnigManager = ClientBuildingManger.new()
		RemoteProvider:GetForBuild().Build.OnClientEvent:Connect(function(m)
			return self.buildnigManager:Build(m)
		end)
	end
	function BuildController:RotationMode(toRight)
		if self.viewModel then
			if self.viewModel:IsRotation() then
				self.viewModel:StopRotation()
			else
				self.viewModel:StartRotation(toRight)
			end
		end
	end
	function BuildController:PreviewMode(buildingID)
		if self.viewModel then
			self.viewModel:LoadNewModel(buildingID)
		end
		self.viewModel = ViewModel.new(buildingID, self.viewModelConfig):View()
		self.moveHandler:Start(self.viewModel)
	end
	function BuildController:Cancel()
		local _result = self.viewModel
		if _result ~= nil then
			_result = _result:GetModel():Destroy()
		end
	end
	function BuildController:Build()
		if self.viewModel then
			local buildingID = self.viewModel:GetBuildingName()
			self.buildEvent:FireServer(buildingID, self.viewModel:GetCF())
			self.moveHandler:Stop()
		end
	end
end
return {
	BuildController = BuildController,
}
