-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ContextActionService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ContextActionService
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local AutoFireModule = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "AutoFireModule").AutoFireModule
local BindedAutoFireModule
do
	local super = AutoFireModule
	BindedAutoFireModule = setmetatable({}, {
		__tostring = function()
			return "BindedAutoFireModule"
		end,
		__index = super,
	})
	BindedAutoFireModule.__index = BindedAutoFireModule
	function BindedAutoFireModule.new(...)
		local self = setmetatable({}, BindedAutoFireModule)
		return self:constructor(...) or self
	end
	function BindedAutoFireModule:constructor(...)
		super.constructor(self, ...)
		self.bindData = GlobalConfig.BIND_DATA.Weapon.Fire
		self.remote = RemoteProvider:GetForWeapon()
	end
	function BindedAutoFireModule:Bind()
		ContextActionService:BindAction(self.bindData.Action, function(name, state)
			if name == self.bindData.Action then
				if state == Enum.UserInputState.Begin then
					self.remote.StartFire:FireServer(self.weapon:GetName())
					self:StartFire()
				elseif state == Enum.UserInputState.End then
					self.remote.StopFire:FireServer(self.weapon:GetName())
					self:StopFire()
				end
			end
		end, false, self.bindData.PC.Input)
	end
	function BindedAutoFireModule:Unbind()
		self:StopFire()
		ContextActionService:UnbindAction(self.bindData.Action)
	end
end
return {
	BindedAutoFireModule = BindedAutoFireModule,
}
