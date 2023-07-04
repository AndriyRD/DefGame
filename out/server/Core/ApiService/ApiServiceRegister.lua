-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ServerScriptService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ServerScriptService
local ApiServiceRegister
do
	ApiServiceRegister = setmetatable({}, {
		__tostring = function()
			return "ApiServiceRegister"
		end,
	})
	ApiServiceRegister.__index = ApiServiceRegister
	function ApiServiceRegister.new(...)
		local self = setmetatable({}, ApiServiceRegister)
		return self:constructor(...) or self
	end
	function ApiServiceRegister:constructor()
		self.apiServices = {}
		self.instnaceContainer = Instance.new("Folder")
		self.instnaceContainer.Parent = ServerScriptService
		self.instnaceContainer.Name = "Api"
		warn("Crated Api container")
	end
	function ApiServiceRegister:CreateMethodInstancesContainer(apiService)
		local newContainer = Instance.new("Folder", self.instnaceContainer)
		newContainer.Name = apiService:GetId()
		local _apiServices = self.apiServices
		local _apiService = apiService
		_apiServices[newContainer] = _apiService
		return newContainer
	end
	function ApiServiceRegister:Register(apiService)
		local container = self:CreateMethodInstancesContainer(apiService)
		local _serviceHandlers = apiService.ServiceHandlers
		local _arg0 = function(handler, key)
			local methodInst = Instance.new("BindableFunction")
			methodInst.Parent = container
			methodInst.Name = key
			methodInst.OnInvoke = handler
		end
		for _k, _v in _serviceHandlers do
			_arg0(_v, _k, _serviceHandlers)
		end
		return self
	end
end
return {
	ApiServiceRegister = ApiServiceRegister,
}
