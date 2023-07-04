-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local AutoFireModule = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "AutoFireModule").AutoFireModule
local WeaponProvider = TS.import(script, script.Parent.Parent, "WeaponProvider").WeaponProvider
local PlayerFireModules = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "PlayerFireModules").PlayerFireModules
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local GetCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "GetCharacter")
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local WeaponReplicator
do
	WeaponReplicator = setmetatable({}, {
		__tostring = function()
			return "WeaponReplicator"
		end,
	})
	WeaponReplicator.__index = WeaponReplicator
	function WeaponReplicator.new(...)
		local self = setmetatable({}, WeaponReplicator)
		return self:constructor(...) or self
	end
	function WeaponReplicator:constructor()
		self.list = PlayerFireModules.new()
	end
	function WeaponReplicator:IsLocalPlayer(plr)
		return Players.LocalPlayer == plr
	end
	function WeaponReplicator:OnCreateWeapon(plr, id)
		if self:IsLocalPlayer(plr) then
			return nil
		end
		local model = GetCharacter(plr):WaitForChild(id)
		local weaponContainer = WeaponProvider.weaponManager:RegisterWeapon(plr, model)
		local fireModule = AutoFireModule.new(weaponContainer)
		self.list:Add(plr, model.Name, fireModule)
	end
	function WeaponReplicator:OnStartFire(plr, weaponID)
		if self:IsLocalPlayer(plr) then
			return nil
		end
		self.list:GetFireModule(plr, weaponID).FireModule:StartFire()
	end
	function WeaponReplicator:OnStopFire(plr, weaponID)
		if self:IsLocalPlayer(plr) then
			return nil
		end
		self.list:GetFireModule(plr, weaponID).FireModule:StopFire()
	end
	function WeaponReplicator:Run()
		local events = RemoteProvider:GetForWeapon()
		events.CreateWeapon.OnClientEvent:Connect(function(p, m)
			return self:OnCreateWeapon(p, m)
		end)
		events.StartFire.OnClientEvent:Connect(function(p, n)
			return self:OnStartFire(p, n)
		end)
		events.StopFire.OnClientEvent:Connect(function(p, n)
			return self:OnStopFire(p, n)
		end)
	end
end
return {
	WeaponReplicator = WeaponReplicator,
}
