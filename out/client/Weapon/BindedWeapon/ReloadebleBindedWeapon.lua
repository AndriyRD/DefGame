-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ContextActionService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ContextActionService
local BindedWeapon = TS.import(script, script.Parent, "BindedWeapon").BindedWeapon
local ReloadebleBindedWeapon
do
	local super = BindedWeapon
	ReloadebleBindedWeapon = setmetatable({}, {
		__tostring = function()
			return "ReloadebleBindedWeapon"
		end,
		__index = super,
	})
	ReloadebleBindedWeapon.__index = ReloadebleBindedWeapon
	function ReloadebleBindedWeapon.new(...)
		local self = setmetatable({}, ReloadebleBindedWeapon)
		return self:constructor(...) or self
	end
	function ReloadebleBindedWeapon:constructor(...)
		super.constructor(self, ...)
	end
	function ReloadebleBindedWeapon:Bind()
		ContextActionService:BindAction(self.bindData.Reload.Action, function(name, state)
			if name == self.bindData.Reload.Action and state == Enum.UserInputState.Begin then
				self.remote.Reload:FireServer(self.name)
				self.weapon:Reload()
			end
		end, false, self.bindData.Reload.PC.Input)
	end
	function ReloadebleBindedWeapon:Unbind()
		ContextActionService:UnbindAction(self.bindData.Reload.Action)
	end
end
return {
	ReloadebleBindedWeapon = ReloadebleBindedWeapon,
}
