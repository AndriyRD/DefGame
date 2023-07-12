-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local PlayerStorageContainer = TS.import(script, game:GetService("ServerScriptService"), "TS", "Core", "PlayerStorage", "PlayerStorageContainer").PlayerStorageContainer
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local PlayerFireModules = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "PlayerFireModules").PlayerFireModules
local AutoFireModule = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "AutoFireModule").AutoFireModule
local ServerWeaponManager = TS.import(script, game:GetService("ServerScriptService"), "TS", "Weapon", "ServerWeaponManager").ServerWeaponManager
local WeaponController
do
	local super = PlayerStorageContainer
	WeaponController = setmetatable({}, {
		__tostring = function()
			return "WeaponController"
		end,
		__index = super,
	})
	WeaponController.__index = WeaponController
	function WeaponController.new(...)
		local self = setmetatable({}, WeaponController)
		return self:constructor(...) or self
	end
	function WeaponController:constructor(...)
		super.constructor(self, ...)
		self.remote = RemoteProvider:GetForWeapon()
		self.serverWeaponManager = ServerWeaponManager.new()
		self.playerFireModules = PlayerFireModules.new()
	end
	function WeaponController:CreateWeapon(owner, model)
		local weaponContainer = self.serverWeaponManager:RegisterWeapon(owner, model)
		local weapon = weaponContainer:GetWeapon()
		local id = weapon:GetName()
		self:AddItem(owner, id, weaponContainer)
		self.playerFireModules:Add(owner, id, AutoFireModule.new(weaponContainer))
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
end
return {
	WeaponController = WeaponController,
}
