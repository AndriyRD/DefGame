-- Compiled with roblox-ts v2.1.0
local BaseWeapon
do
	BaseWeapon = setmetatable({}, {
		__tostring = function()
			return "BaseWeapon"
		end,
	})
	BaseWeapon.__index = BaseWeapon
	function BaseWeapon.new(...)
		local self = setmetatable({}, BaseWeapon)
		return self:constructor(...) or self
	end
	function BaseWeapon:constructor(owner, name, model, config, ammo)
		self.owner = owner
		self.name = name
		self.model = model
		self.config = config
		self.ammo = ammo
	end
	function BaseWeapon:GetName()
		return self.name
	end
	function BaseWeapon:GetOwner()
		return self.owner
	end
	function BaseWeapon:GetWeaponModel()
		return self.model
	end
	function BaseWeapon:GetConfig()
		return self.config
	end
	function BaseWeapon:GetAmmoContainer()
		return self.ammo
	end
	function BaseWeapon:GetFireDelay()
		return 1 / self:GetConfig().FireSpeed
	end
end
return {
	BaseWeapon = BaseWeapon,
}
