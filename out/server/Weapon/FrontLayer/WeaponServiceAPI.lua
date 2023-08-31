-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponController = TS.import(script, game:GetService("ServerScriptService"), "TS", "Weapon", "WeaponController").WeaponController
local WeaponServiceAPI
do
	WeaponServiceAPI = setmetatable({}, {
		__tostring = function()
			return "WeaponServiceAPI"
		end,
	})
	WeaponServiceAPI.__index = WeaponServiceAPI
	function WeaponServiceAPI.new(...)
		local self = setmetatable({}, WeaponServiceAPI)
		return self:constructor(...) or self
	end
	function WeaponServiceAPI:constructor()
	end
	function WeaponServiceAPI:Create(model)
		self.controller:CreateWeapon(model)
	end
	function WeaponServiceAPI:Get(globalID)
		return self.controller:Get(globalID)
	end
	function WeaponServiceAPI:StartFire(plr, globalID)
		self.controller:StartFire(plr, globalID)
	end
	function WeaponServiceAPI:StopFire(plr, globalID)
		self.controller:StopFire(plr, globalID)
	end
	function WeaponServiceAPI:DropWeapon(globalID)
		self.controller:DropWeapon(globalID)
	end
	function WeaponServiceAPI:SetNewOwner(owner, globalId)
		self.controller:SetNewWeaponOwner(owner, globalId)
	end
	WeaponServiceAPI.controller = WeaponController.new()
end
return {
	WeaponServiceAPI = WeaponServiceAPI,
}
