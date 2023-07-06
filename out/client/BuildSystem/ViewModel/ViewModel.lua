-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RotateModule = TS.import(script, script.Parent, "RoteateModule").RotateModule
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
	function ViewModel:constructor(id, config)
		self.config = config
		self.availableBuild = false
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
				item.Transparency = self.config.Transparency
			end
		end
	end
	function ViewModel:View()
		self.model.Parent = GlobalConfig.DEBRIS
	end
	function ViewModel:Destroy()
		self.model:Destroy()
		table.clear(self.config)
		table.clear(self)
	end
	function ViewModel:ChangeState()
		if self.availableBuild then
			self:ChacngeModelColor(self.config.ModelColors.Available)
		else
			self:ChacngeModelColor(self.config.ModelColors.Cancaled)
		end
		self.availableBuild = not self.availableBuild
	end
	function ViewModel:LoadNewModel(id)
		if self.model then
			self.model:Destroy()
		end
		self.model = ViewModelLoader:Load(id)
		self:InitModel()
		self.rotateModule:SetNewModel(self.model)
	end
	function ViewModel:GetRoationModule()
		return self.rotateModule
	end
	function ViewModel:GetBuildingName()
		return self.model.Name
	end
	function ViewModel:GetCF()
		return self.model:GetPivot()
	end
end
return {
	ViewModel = ViewModel,
}
