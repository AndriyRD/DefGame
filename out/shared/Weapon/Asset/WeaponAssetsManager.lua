-- Compiled with roblox-ts v2.1.0
local WeaponAssets
do
	WeaponAssets = setmetatable({}, {
		__tostring = function()
			return "WeaponAssets"
		end,
	})
	WeaponAssets.__index = WeaponAssets
	function WeaponAssets.new(...)
		local self = setmetatable({}, WeaponAssets)
		return self:constructor(...) or self
	end
	function WeaponAssets:constructor(weaponModel, assets)
		self.weaponModel = weaponModel
		self.assets = assets
	end
	function WeaponAssets:Laod()
		print("Load assets " .. tostring(self.weaponModel.Model))
	end
	function WeaponAssets:FireSound()
	end
end
return {
	WeaponAssets = WeaponAssets,
}
