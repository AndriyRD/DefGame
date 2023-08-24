-- Compiled with roblox-ts v2.1.0
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
	function WeaponOwnerState:constructor()
		self.ChangeOwnerEvent = Instance.new("BindableEvent")
	end
	function WeaponOwnerState:ChagneOwner(newOwner)
		self.owner = newOwner
		self.owner = newOwner
		self.ChangeOwnerEvent:Fire(nil, newOwner)
		return self
	end
	function WeaponOwnerState:RemoveOwner()
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
