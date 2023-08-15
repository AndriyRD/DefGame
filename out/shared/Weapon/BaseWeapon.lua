-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponAssetParser = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Asset", "WeaponAssetParser").WeaponAssetParser
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
		self.assets = WeaponAssetParser:Parse(self.name)
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
	function BaseWeapon:GetAssets()
		return self.assets
	end
	function BaseWeapon:Relaod()
		self:GetAmmoContainer():Reload()
		return self
	end
end
return {
	BaseWeapon = BaseWeapon,
}
