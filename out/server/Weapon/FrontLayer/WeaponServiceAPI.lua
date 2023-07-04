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
	function WeaponServiceAPI:Create(plr, model)
		self.controller:CreateWeapon(plr, model)
	end
	function WeaponServiceAPI:Get(plr, id)
		return self.controller:Get(plr):GetItem(id)
	end
	function WeaponServiceAPI:StartFire(plr, id)
		self.controller:StartFire(plr, id)
	end
	function WeaponServiceAPI:StopFire(plr, id)
		self.controller:StopFire(plr, id)
	end
	WeaponServiceAPI.controller = WeaponController.new()
end
return {
	WeaponServiceAPI = WeaponServiceAPI,
}
