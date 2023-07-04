-- Compiled with roblox-ts v2.1.0
local WeaponContainer
do
	WeaponContainer = setmetatable({}, {
		__tostring = function()
			return "WeaponContainer"
		end,
	})
	WeaponContainer.__index = WeaponContainer
	function WeaponContainer.new(...)
		local self = setmetatable({}, WeaponContainer)
		return self:constructor(...) or self
	end
	function WeaponContainer:constructor(weapon, fireHandler, hitHandler)
		self.weapon = weapon
		self.fireHandler = fireHandler
		self.hitHandler = hitHandler
		self.owner = weapon:GetOwner()
	end
	function WeaponContainer:Fire()
		self.fireHandler:Fire()
		self.weapon:GetAmmoContainer():GetMagazine():Take()
	end
	function WeaponContainer:GetOwner()
		return self.owner
	end
	function WeaponContainer:GetWeapon()
		return self.weapon
	end
	function WeaponContainer:GetFireHandler()
		return self.fireHandler
	end
	function WeaponContainer:GetHitHandler()
		return self.hitHandler
	end
	function WeaponContainer:Destory()
	end
end
return {
	WeaponContainer = WeaponContainer,
}
