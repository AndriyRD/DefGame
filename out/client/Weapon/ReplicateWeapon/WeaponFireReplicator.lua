-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local GetCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "GetCharacter")
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local WeaponProvider = TS.import(script, script.Parent.Parent, "WeaponProvider").WeaponProvider
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
		self.IsLocalPlayer = function(plr)
			return Players.LocalPlayer == plr
		end
	end
	function WeaponReplicator:OnCreateWeapon(plr, id)
		if self.IsLocalPlayer(plr) then
			return nil
		end
		local model = GetCharacter(plr):WaitForChild(id)
		WeaponProvider:RegisterWeapon(model)
	end
	function WeaponReplicator:OnStartFire(plr, weaponGlobalID)
		if self.IsLocalPlayer(plr) then
			return nil
		end
		WeaponProvider:Find(weaponGlobalID):StartFire()
	end
	function WeaponReplicator:OnStopFire(plr, weaponGlobalID)
		if self.IsLocalPlayer(plr) then
			return nil
		end
		WeaponProvider:Find(weaponGlobalID):StopFire()
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
