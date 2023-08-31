-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Workspace = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local IdentifiedInstance
do
	IdentifiedInstance = setmetatable({}, {
		__tostring = function()
			return "IdentifiedInstance"
		end,
	})
	IdentifiedInstance.__index = IdentifiedInstance
	function IdentifiedInstance.new(...)
		local self = setmetatable({}, IdentifiedInstance)
		return self:constructor(...) or self
	end
	function IdentifiedInstance:constructor(instance)
		self.instance = instance
		self.GetId = function()
			return self.id
		end
		self.GetInstance = function()
			return self.instance
		end
		local currentIdInstance = instance:FindFirstChild(GlobalConfig.GLOBAL_ID_INSTANCE_NAME)
		if currentIdInstance and currentIdInstance:IsA("NumberValue") then
			self.id = currentIdInstance.Value
			self.idValueInstance = currentIdInstance
		else
			self.id = tick()
			self.idValueInstance = Instance.new("NumberValue")
			self.idValueInstance.Value = self.id
			self.idValueInstance.Parent = instance
			self.idValueInstance.Name = GlobalConfig.GLOBAL_ID_INSTANCE_NAME
		end
	end
	function IdentifiedInstance:FindById(globalID)
		for _, item in Workspace:GetDescendants() do
			local idValInst = item:FindFirstChild(GlobalConfig.GLOBAL_ID_INSTANCE_NAME)
			if idValInst and (idValInst:IsA("NumberValue") and idValInst.Value == globalID) then
				return item
			end
		end
	end
	function IdentifiedInstance:FindAndWrap(globalID)
		local inst = self:FindById(globalID)
		local wrappedInst = IdentifiedInstance.new(inst)
		wrappedInst.id = globalID
		return wrappedInst
	end
	function IdentifiedInstance:ParseFrom(model)
		local idValInstance = model:FindFirstChild(GlobalConfig.GLOBAL_ID_INSTANCE_NAME)
		local wrappedInstance = IdentifiedInstance.new(model)
		wrappedInstance.id = idValInstance.Value
		return wrappedInstance
	end
end
return {
	IdentifiedInstance = IdentifiedInstance,
}
