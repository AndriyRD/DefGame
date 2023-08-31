-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local ServerWeaponManager = TS.import(script, game:GetService("ServerScriptService"), "TS", "Weapon", "ServerWeaponManager").ServerWeaponManager
local WeaponController
do
	WeaponController = setmetatable({}, {
		__tostring = function()
			return "WeaponController"
		end,
	})
	WeaponController.__index = WeaponController
	function WeaponController.new(...)
		local self = setmetatable({}, WeaponController)
		return self:constructor(...) or self
	end
	function WeaponController:constructor()
		self.remote = RemoteProvider:GetForWeapon()
		self.weaponManager = ServerWeaponManager.new()
	end
	function WeaponController:CreateWeapon(model)
		return self.weaponManager:RegisterWeapon(model)
	end
	function WeaponController:StartFire(plr, globalId)
		print("Start fire event: " .. tostring(globalId))
		self.weaponManager:FindByGlobalId(globalId):StartFire()
		self.remote.StartFire:FireAllClients(plr, globalId)
	end
	function WeaponController:StopFire(plr, globalId)
		self.weaponManager:FindByGlobalId(globalId):StopFire()
		self.remote.StopFire:FireAllClients(plr, globalId)
	end
	function WeaponController:Get(globalId)
		print("Get event: " .. tostring(globalId))
		return self.weaponManager:FindByGlobalId(globalId)
	end
	function WeaponController:DropWeapon(globalId)
		print("Drop event: " .. tostring(globalId))
		local weapon = self:Get(globalId)
		if weapon then
			weapon.OwnerState:RemoveOwner()
		else
			error("Not found weapon by global-id: " .. tostring(globalId))
		end
	end
	function WeaponController:SetNewWeaponOwner(newOwner, globalId)
		local weapon = self.weaponManager:FindByGlobalId(globalId)
		if weapon then
			weapon.OwnerState:ChagneOwner(newOwner)
		else
			error("Not found registered weapon by global-id " .. tostring(globalId))
		end
	end
end
return {
	WeaponController = WeaponController,
}
