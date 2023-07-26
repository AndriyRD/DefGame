-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RotateModule = TS.import(script, script.Parent, "RotateModule").RotateModule
local ViewModelLoader = TS.import(script, script.Parent, "ViewModelLoader").ViewModelLoader
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local ViewModel
do
	ViewModel = setmetatable({}, {
		__tostring = function()
			return "ViewModel"
		end,
	})
	ViewModel.__index = ViewModel
	function ViewModel.new(...)
		local self = setmetatable({}, ViewModel)
		return self:constructor(...) or self
	end
	function ViewModel:constructor(id, vmConfig)
		self.vmConfig = vmConfig
		self.availableBuild = true
		self.rotation = false
		self.model = ViewModelLoader:Load(id)
		self:InitModel()
		self.rotateModule = RotateModule.new(self.model)
	end
	function ViewModel:ChacngeModelColor(color)
		for _, item in self.model:GetDescendants() do
			if item:IsA("BasePart") then
				item.BrickColor = color
			end
		end
	end
	function ViewModel:InitModel()
		for _, item in self.model:GetDescendants() do
			if item:IsA("BasePart") or item:IsA("Decal") then
				item.Transparency = self.vmConfig.Transparency
			end
		end
	end
	function ViewModel:IsAvailableBuild()
		return self.availableBuild
	end
	function ViewModel:GetModel()
		return self.model
	end
	function ViewModel:View()
		self.model.Parent = GlobalConfig.DEBRIS
		return self
	end
	function ViewModel:Dispose()
		local _result = self.model
		if _result ~= nil then
			_result:Destroy()
		end
		table.clear(self.vmConfig)
		table.clear(self)
	end
	function ViewModel:ChangeState()
		self.availableBuild = not self.availableBuild
		if self.availableBuild then
			self:ChacngeModelColor(self.vmConfig.ModelColors.Available)
		else
			self:ChacngeModelColor(self.vmConfig.ModelColors.Cancaled)
		end
	end
	function ViewModel:LoadNewModel(id)
		if self.model then
			self.model:Destroy()
		end
		self.model = ViewModelLoader:Load(id)
		self:InitModel()
		self.rotateModule:SetNewModel(self.model)
	end
	function ViewModel:GetBuildingName()
		return self.model.Name
	end
	function ViewModel:GetCF()
		return self.model:GetPivot()
	end
	function ViewModel:StartRotation(toRight)
		self.rotateModule:Rotation(toRight)
		self.rotation = true
	end
	function ViewModel:StopRotation()
		self.rotateModule:CancelIfRotateion()
		self.rotation = false
	end
	function ViewModel:IsRotation()
		return self.rotation
	end
end
return {
	ViewModel = ViewModel,
}
