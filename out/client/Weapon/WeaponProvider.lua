-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ClientWeaponManager = TS.import(script, script.Parent, "ClientWeaponManager").ClientWeaponManager
local WeaponProvider
do
	WeaponProvider = setmetatable({}, {
		__tostring = function()
			return "WeaponProvider"
		end,
	})
	WeaponProvider.__index = WeaponProvider
	function WeaponProvider.new(...)
		local self = setmetatable({}, WeaponProvider)
		return self:constructor(...) or self
	end
	function WeaponProvider:constructor()
	end
	function WeaponProvider:RegisterWeapon(model)
		return WeaponProvider.manager:RegisterWeapon(model)
	end
	function WeaponProvider:Find(globalID)
		return self.manager:FindByGlobalId(globalID)
	end
	WeaponProvider.manager = ClientWeaponManager.new()
end
return {
	WeaponProvider = WeaponProvider,
}
