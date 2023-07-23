-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EventProvider = TS.import(script, script.Parent.Parent, "EventProvider").EventProvider
local BuildBindModule = TS.import(script, script.Parent, "BuildBindModule").BuildBindModule
local BuildController = TS.import(script, script.Parent, "BuildController").BuildController
local PlayerBuildModule
do
	PlayerBuildModule = setmetatable({}, {
		__tostring = function()
			return "PlayerBuildModule"
		end,
	})
	PlayerBuildModule.__index = PlayerBuildModule
	function PlayerBuildModule.new(...)
		local self = setmetatable({}, PlayerBuildModule)
		return self:constructor(...) or self
	end
	function PlayerBuildModule:constructor()
		self.controller = BuildController.new()
		self.bindModule = BuildBindModule.new()
		EventProvider.Build.PreviewMode.Event:Connect(function(id)
			return self:Preview(id)
		end)
	end
	function PlayerBuildModule:Unbind()
		self.bindModule:Unbind()
	end
	function PlayerBuildModule:OnCancel()
		self.controller:Cancel()
		self:Unbind()
	end
	function PlayerBuildModule:OnBuild()
		self.controller:Build()
		self:OnCancel()
	end
	function PlayerBuildModule:Preview(id)
		self.controller:PreviewMode(id)
		self.bindModule:BindBuild(function()
			return self:OnBuild()
		end)
		self.bindModule:BindCancle(function()
			return self:OnCancel()
		end)
		self.bindModule:BindRotation(function(toRight)
			return self.controller:RotationMode(toRight)
		end)
	end
end
return {
	PlayerBuildModule = PlayerBuildModule,
}
