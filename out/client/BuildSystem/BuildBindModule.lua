-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local ContextActionService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ContextActionService
local BuildBindModule
do
	BuildBindModule = setmetatable({}, {
		__tostring = function()
			return "BuildBindModule"
		end,
	})
	BuildBindModule.__index = BuildBindModule
	function BuildBindModule.new(...)
		local self = setmetatable({}, BuildBindModule)
		return self:constructor(...) or self
	end
	function BuildBindModule:constructor()
		self.bindData = GlobalConfig.BIND_DATA.Build
	end
	function BuildBindModule:IsRotationToRight(input)
		local rotationInput = self.bindData.Rotate.PC.Input
		if input.KeyCode == rotationInput[1] then
			return true
		elseif input.KeyCode == rotationInput[2] then
			return false
		else
			error("Build bind error")
		end
	end
	function BuildBindModule:BindBuild(onBuild)
		local bindInfo = self.bindData.Build
		ContextActionService:BindAction(bindInfo.Action, function(name, state)
			if name == bindInfo.Action and state == Enum.UserInputState.Begin then
				onBuild()
			end
		end, false, bindInfo.PC.Input)
	end
	function BuildBindModule:BindCancle(onCancel)
		local bindInfo = self.bindData.Cancel
		ContextActionService:BindAction(bindInfo.Action, function(name, state)
			if name == bindInfo.Action and state == Enum.UserInputState.Begin then
				onCancel()
			end
		end, false, unpack(bindInfo.PC.Input))
	end
	function BuildBindModule:BindRotation(changeRotationState)
		local bindInfo = self.bindData.Rotate
		ContextActionService:BindAction(bindInfo.Action, function(name, state, input)
			if name == bindInfo.Action then
				if state == Enum.UserInputState.Begin then
					changeRotationState(self:IsRotationToRight(input))
				elseif state == Enum.UserInputState.End then
					changeRotationState(self:IsRotationToRight(input))
				end
			end
		end, false, unpack(bindInfo.PC.Input))
	end
	function BuildBindModule:Unbind()
		ContextActionService:UnbindAction(self.bindData.Build.Action)
		ContextActionService:UnbindAction(self.bindData.Cancel.Action)
		ContextActionService:UnbindAction(self.bindData.Rotate.Action)
	end
end
return {
	BuildBindModule = BuildBindModule,
}
