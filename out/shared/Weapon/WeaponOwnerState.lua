-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local WeaponOwnerState
do
	WeaponOwnerState = setmetatable({}, {
		__tostring = function()
			return "WeaponOwnerState"
		end,
	})
	WeaponOwnerState.__index = WeaponOwnerState
	function WeaponOwnerState.new(...)
		local self = setmetatable({}, WeaponOwnerState)
		return self:constructor(...) or self
	end
	function WeaponOwnerState:constructor(weaponGlobalId)
		self.weaponGlobalId = weaponGlobalId
		self.remote = RemoteProvider:GetForWeapon()
		self.ChangeOwnerEvent = Instance.new("BindableEvent")
	end
	function WeaponOwnerState:RemoteCallChangeState(event)
		if RunService:IsClient() then
			event:FireServer(self.owner, self.weaponGlobalId)
		else
			event:FireAllClients(self.owner, self.weaponGlobalId)
		end
	end
	function WeaponOwnerState:ChagneOwner(newOwner)
		self.owner = newOwner
		self:RemoteCallChangeState(self.remote.NewWeaponOwner)
		self.ChangeOwnerEvent:Fire(nil, newOwner)
		return self
	end
	function WeaponOwnerState:RemoveOwner()
		self:RemoteCallChangeState(self.remote.DropWeapon)
		self.ChangeOwnerEvent:Fire(self.owner, nil)
		self.owner = nil
		return self
	end
	function WeaponOwnerState:GetCurrent()
		return self.owner
	end
end
return {
	WeaponOwnerState = WeaponOwnerState,
}
