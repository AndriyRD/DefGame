-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local BaseViewModelConfig = TS.import(script, script.Parent, "ViewModel", "BaseViewModelConfig")
local ViewModel = TS.import(script, script.Parent, "ViewModel", "ViewModel").ViewModel
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
		self.viewModelConfig = BaseViewModelConfig
		self.buildEvent = RemoteProvider:GetForBuild().Build
	end
	function BuildController:GetRoationModule()
		local _result = self.viewModel
		if _result ~= nil then
			_result = _result:GetRoationModule()
		end
		return _result
	end
	function BuildController:PreviewMode(buildingID)
		if self.viewModel then
			self.viewModel:LoadNewModel(buildingID)
		end
		self.viewModel = ViewModel.new(buildingID, self.viewModelConfig)
	end
	function BuildController:Cancel()
		local _result = self.viewModel
		if _result ~= nil then
			_result:Destroy()
		end
	end
	function BuildController:Build()
		if self.viewModel then
			local buildingID = self.viewModel:GetBuildingName()
			self.buildEvent:FireServer(buildingID, self.viewModel:GetCF())
		end
	end
end
return {
	BuildController = BuildController,
}
