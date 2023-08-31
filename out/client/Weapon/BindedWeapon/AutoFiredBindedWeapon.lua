-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ContextActionService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ContextActionService
local BindedWeapon = TS.import(script, script.Parent, "BindedWeapon").BindedWeapon
local AutoFiredBindedWeapon
do
	local super = BindedWeapon
	AutoFiredBindedWeapon = setmetatable({}, {
		__tostring = function()
			return "AutoFiredBindedWeapon"
		end,
		__index = super,
	})
	AutoFiredBindedWeapon.__index = AutoFiredBindedWeapon
	function AutoFiredBindedWeapon.new(...)
		local self = setmetatable({}, AutoFiredBindedWeapon)
		return self:constructor(...) or self
	end
	function AutoFiredBindedWeapon:constructor(...)
		super.constructor(self, ...)
	end
	function AutoFiredBindedWeapon:Bind()
		ContextActionService:BindAction(self.bindData.Fire.Action, function(name, state)
			if name == self.bindData.Fire.Action then
				if state == Enum.UserInputState.Begin then
					self.remote.StartFire:FireServer(self.weapon:GetModelID())
					self.weapon:StartFire()
					self.cameraEvents.Shake:Fire()
				elseif state == Enum.UserInputState.End then
					self.remote.StopFire:FireServer(self.weapon:GetModelID())
					self.weapon:StopFire()
					self.cameraEvents.StopShake:Fire()
				end
			end
		end, false, self.bindData.Fire.PC.Input)
	end
	function AutoFiredBindedWeapon:Unbind()
		self.weapon:StopFire()
		self.remote.StopFire:FireServer(self.weapon:GetModelID())
		ContextActionService:UnbindAction(self.bindData.Fire.Action)
		self.cameraEvents.StopShake:Fire()
	end
end
return {
	AutoFiredBindedWeapon = AutoFiredBindedWeapon,
}
