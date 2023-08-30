-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local PlayerFireModules = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "PlayerFireModules").PlayerFireModules
local ServerWeaponManager = TS.import(script, game:GetService("ServerScriptService"), "TS", "Weapon", "ServerWeaponManager").ServerWeaponManager
local AutoFire = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "FireModule", "AutoFire").AutoFire
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
		self.playerFireModules = PlayerFireModules.new()
	end
	function WeaponController:CreateWeapon(owner, model)
		local weapon = self.weaponManager:RegisterWeapon(model)
		local id = weapon.DataObject.Name
		self.playerFireModules:Add(owner, id, AutoFire.new(weapon.fireModule))
		self.remote.CreateWeapon:FireAllClients(owner, id)
	end
	function WeaponController:StartFire(plr, id)
		self.playerFireModules:GetFireModule(plr, id).FireModule:StartFire()
		self.remote.StartFire:FireAllClients(plr, id)
	end
	function WeaponController:StopFire(plr, id)
		self.playerFireModules:GetFireModule(plr, id).FireModule:StopFire()
		self.remote.StopFire:FireAllClients(plr, id)
	end
	function WeaponController:Get(owner, id)
		return self.weaponManager:GetById(owner, id)
	end
	function WeaponController:DropWeapon(owner, id)
		local weapon = self.weaponManager:GetById(owner, id)
		if weapon then
			weapon.OwnerState:RemoveOwner()
		else
			error("Not found weapon: " .. (id .. (" for player: " .. tostring(owner))))
		end
	end
	function WeaponController:SetNewWeaponOwner(newOwner, weaponModel)
		local weapon = self.weaponManager:GetByModel(weaponModel)
		if weapon then
			weapon.OwnerState:ChagneOwner(newOwner)
		else
			error("Not found registered weapon by model: " .. weaponModel:GetFullName())
		end
	end
end
return {
	WeaponController = WeaponController,
}
