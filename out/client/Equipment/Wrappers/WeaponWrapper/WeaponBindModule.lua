-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ContextActionService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ContextActionService
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local WeaponBindModule
do
	WeaponBindModule = setmetatable({}, {
		__tostring = function()
			return "WeaponBindModule"
		end,
	})
	WeaponBindModule.__index = WeaponBindModule
	function WeaponBindModule.new(...)
		local self = setmetatable({}, WeaponBindModule)
		return self:constructor(...) or self
	end
	function WeaponBindModule:constructor(weapon, autoFireModule)
		self.weapon = weapon
		self.autoFireModule = autoFireModule
		self.bindData = GlobalConfig.BIND_DATA.Weapon
		self.remote = RemoteProvider:GetForWeapon()
	end
	function WeaponBindModule:Bind()
		ContextActionService:BindAction(self.bindData.Fire.Action, function(name, state)
			if name == self.bindData.Fire.Action then
				if state == Enum.UserInputState.Begin then
					self.remote.StartFire:FireServer(self.weapon:GetName())
					self.autoFireModule:StartFire()
				elseif state == Enum.UserInputState.End then
					self.remote.StopFire:FireServer(self.weapon:GetName())
					self.autoFireModule:StopFire()
				end
			end
		end, false, self.bindData.Fire.PC.Input)
		ContextActionService:BindAction(self.bindData.Reload.Action, function(name, state)
			if name == self.bindData.Reload.Action and state == Enum.UserInputState.Begin then
				self.remote.Reload:FireServer(self.weapon:GetName())
				self.weapon:Relaod()
			end
		end, false, self.bindData.Reload.PC.Input)
	end
	function WeaponBindModule:Unbind()
		self.autoFireModule:StopFire()
		self.remote.StopFire:FireServer(self.weapon:GetName())
		ContextActionService:UnbindAction(self.bindData.Fire.Action)
		ContextActionService:UnbindAction(self.bindData.Reload.Action)
	end
end
return {
	WeaponBindModule = WeaponBindModule,
}
